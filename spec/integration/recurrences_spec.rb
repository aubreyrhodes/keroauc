require 'spec_helper'

describe 'Managing recurences' do
  let(:user){ User.create(uid: 'test_uid') }
  let(:other_user){ User.create }

  before do
    login(user)
  end

  describe 'creating a recurrence' do
    let(:recurrence){ { frequency: 'daily' } }

    before do
      post '/recurrences.json', recurrence: recurrence
    end

    it 'allows a new task to be created' do
      expect(response.status).to eq 201
    end
  end
end
