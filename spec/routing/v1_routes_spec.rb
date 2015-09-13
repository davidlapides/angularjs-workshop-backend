require 'rails_helper'

describe 'API V1 Routes' do
  describe 'todos' do
    specify 'GET /v1/todos' do
      expect(get: '/v1/todos').to route_to(controller: 'v1/todos', action: 'index')
    end

    specify 'POST /v1/todos' do
      expect(post: '/v1/todos').to route_to(controller: 'v1/todos', action: 'create')
    end

    specify 'GET /v1/todos/:id' do
      expect(get: '/v1/todos/123').to route_to(controller: 'v1/todos', action: 'show', id: '123')
    end

    specify 'PUT /v1/todos/:id' do
      expect(put: '/v1/todos/123').to route_to(controller: 'v1/todos', action: 'update', id: '123')
    end

    specify 'DELETE /v1/todos/:id' do
      expect(delete: '/v1/todos/123').to route_to(controller: 'v1/todos', action: 'destroy', id: '123')
    end
  end
end
