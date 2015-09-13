require 'rails_helper'

describe 'V1 Todos API' do
  let(:headers) do
    { 'Accept' => 'application/vnd.api+json' }
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
end
