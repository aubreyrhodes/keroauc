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
      get root_path
      follow_redirect!
      follow_redirect!
      follow_redirect!
      expect(response).to be_success
    end
  end
end
