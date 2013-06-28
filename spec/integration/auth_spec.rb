require 'spec_helper'

describe 'Authentication' do

  it 'does not allow a user to use the app without logging in' do
    setup_mock_auth_failure
    get root_path
    expect(response).to_not be_success
  end

  context 'user has a valid google account' do
    let(:auth_response){ { uid: 'test_uid',
                           info: {
                              name: 'Test Name',
                              email: 'test@email.com'
                          }}}
    before do
      setup_mock_auth_response(auth_response)
    end

    it 'allows a user to authenticate with google and continue to the site' do
      login
      expect(response).to be_success
    end

    it 'creates a new user if the user has never logged in before' do
      expect{login}.to change{User.count}.by(1)
    end

    it 'saves a new users information' do
      login
      expect( User.where(uid: auth_response[:uid]).select(:name, :email).map{|u| [u.name, u.email]}.first).to eq( [ auth_response[:info][:name], auth_response[:info][:email] ])
    end

    it 'does not create a new user for someone who has logged in before' do
      User.create(uid: auth_response[:uid])
      expect{login}.to change{User.count}.by(0)
    end
  end
end

def login
  get root_path
  3.times{ follow_redirect! }
end
