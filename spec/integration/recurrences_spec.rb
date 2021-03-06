require 'spec_helper'

describe 'Managing recurences' do
  let(:user){ User.create(uid: 'test_uid') }
  let(:other_user){ User.create }
  let!(:task){ Task.create }

  before do
    login(user)
  end

  let(:json_response){  JSON.parse(response.body) }

  describe 'creating a recurrence' do
    let(:recurrence){ { frequency: 'daily', task_id: task.id } }

    before do
      post '/recurrences.json', recurrence: recurrence
    end

    it 'allows a new task to be created' do
      expect(response.status).to eq 201
    end

    it 'returns the created recurrence' do
      expect(json_response['frequency']).to eq(recurrence[:frequency])
    end

    it 'sets the tasks recurrence id' do
      expect(task.reload.recurrence_id).to_not be_nil
    end
  end

  describe 'editing a recurrence' do
    let(:recurrence){ Recurrence.create(frequency: 'daily', user: user) }
    let(:updated_attributes){ { frequency: 'weekly' }}

    before do
      put "/recurrences/#{recurrence.id}.json", recurrence: updated_attributes
    end

    it 'updates the task successfully' do
      expect(response.status).to eq(204)
    end
  end

  describe 'veiwing a recurrence' do
    let(:recurrence){ Recurrence.create(frequency: 'daily', user: user) }
    let(:other_users_recurrence){ Recurrence.create(user: other_user) }

    before do
      get "recurrences/#{recurrence.id}.json"
    end

    it 'returns successfully' do
      expect(response.status).to eq(200)
    end

    it 'will not return another users recurrence' do
      get "recurrences/#{other_users_recurrence.id}.json"
      expect(response.status).to eq(404)
    end
  end

  describe 'deleting a recurrence' do
    let!(:recurrence){ Recurrence.create(user: user) }

    before do
      delete "/recurrences/#{recurrence.id}.json"
    end

    it 'deletes the recurrence successfully' do
      expect(response.status).to eq(204)
    end

    it 'removes the recurrence from the server' do
      get "recurrences/#{recurrence.id}.json"
      expect(response.status).to eq(404)
    end
  end
end
