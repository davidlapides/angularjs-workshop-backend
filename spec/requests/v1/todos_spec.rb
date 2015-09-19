require 'rails_helper'

describe 'V1 Todos API' do
  let(:headers) do
    {
      'Accept' => 'application/vnd.api+json',
      'Content-Type' => 'application/vnd.api+json'
    }
  end

  describe 'GET /v1/todos' do
    before { get v1_todos_path, nil, headers }

    it 'responds with success' do
      expect(response).to have_http_status(:ok)
    end

    it 'responds with valid json-api document' do
      expect(response.body).to match_json_schema('v1/todos')
    end
  end

  describe 'POST /v1/todos' do
    let(:body) do
      {
        'data' => {
          'type' => 'todos',
          'attributes' => {
            'task' => 'test',
            'description' => 'need to test this endpoint'
          }
        }
      }
    end
    let(:request) { post v1_todos_path, body.to_json, headers }

    it 'responds with create' do
      request
      expect(response).to have_http_status(:created)
    end

    it 'creates a todo' do
      expect { request }.to change(Todo, :count).by(1)
    end

    it 'responds with valid json-api document' do
      request
      expect(response.body).to match_json_schema('v1/todos')
    end
  end

  describe 'GET /v1/todos/:id' do
    let(:todo) { FactoryGirl.create :todo }
    before { get v1_todo_path(todo.id), nil, headers }

    it 'responds with success' do
      expect(response).to have_http_status(:ok)
    end

    it 'responds with valid json-api document' do
      expect(response.body).to match_json_schema('v1/todos')
    end
  end

  describe 'PUT /v1/todos/:id' do
    let(:todo) { FactoryGirl.create :todo }
    let(:body) do
      {
        'data' => {
          'id' => todo.id.to_s,
          'type' => 'todos',
          'attributes' => {
            'task' => 'my todo'
          }
        }
      }
    end
    let(:request) { put v1_todo_path(todo), body.to_json, headers }

    it 'responds with success' do
      request
      expect(response).to have_http_status(:ok)
    end

    it 'responds with valid json-api document' do
      request
      expect(response.body).to match_json_schema('v1/todos')
    end

    it 'updates todo.task' do
      request
      todo.reload
      expect(todo.task).to eq 'my todo'
    end
  end

  describe 'DELETE /v1/todos/:id' do
    let!(:todo) { FactoryGirl.create :todo }
    let(:request) { delete v1_todo_path(todo), nil, headers }

    it 'responds with no_content' do
      request
      expect(response).to have_http_status(:no_content)
    end

    it 'removes a todo' do
      expect { request }.to change(Todo, :count).by(-1)
    end
  end
end
