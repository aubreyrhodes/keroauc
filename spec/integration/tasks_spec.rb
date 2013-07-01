require 'spec_helper'

describe 'Managing tasks' do
  let(:user){ User.create(uid: 'test_uid') }
  let(:other_user){ User.create }

  before do
    login(user)
  end

  let(:json_response){  JSON.parse(response.body) }

  describe 'creating a task' do
    let(:task){ { title: 'Test Task' } }

    before do
      post '/tasks.json', task: task
    end

    it 'allows a new task to be created' do
      expect(response.status).to eq 201
    end

    it 'returns the created task' do
      expect(json_response['title']).to eq(task[:title])
    end
  end

  describe 'listing existing tasks' do
    let!(:tasks){ 2.times{ Task.create(title: 'test task', user: user) } }
    let!(:completed_task){ Task.create(complete: true, user: user) }
    let!(:other_task){ Task.create(user: other_user) }
    let(:returned_ids){ json_response.map{|j| j['id']} }

    before do
      get '/tasks.json'
    end

    it 'returns successfully' do
      expect(response.status).to eq 200
    end

    it 'returns all existing tasks' do
      expect(json_response.length).to eq(2)
    end

    it 'should not return other users tasks' do
      expect(returned_ids).to_not include(other_task.id)
    end

    it 'should not include complete tasks' do
      expect(returned_ids).to_not include(completed_task.id)
    end
  end

  describe 'editing an existing task' do
    let(:task){ Task.create(title: 'old title', user: user) }
    let(:updated_attributes){ { title: 'new title' } }

    before do
      put "/tasks/#{task.id}.json", task: updated_attributes
    end

    it 'updates the task successfully' do
      expect(response.status).to eq(204)
    end
  end

  describe 'veiwing a task' do
    let!(:task){ Task.create(title: 'task', user: user) }
    let!(:other_users_task){ Task.create(user: other_user) }

    before do
      get "tasks/#{task.id}.json"
    end

    it 'returns successfully' do
      expect(response.status).to eq(200)
    end

    it 'will not return another users task' do
      get "tasks/#{other_users_task.id}.json"
      expect(response.status).to eq(404)
    end
  end

  describe 'deleting a task' do
    let!(:task){ Task.create(title: 'old task', user: user) }

    before do
      delete "/tasks/#{task.id}.json"
    end

    it 'deletes the task successfully' do
      expect(response.status).to eq(204)
    end

    it 'removes the task from the server' do
      get "tasks/#{task.id}.json"
      expect(response.status).to eq(404)
    end
  end
end
