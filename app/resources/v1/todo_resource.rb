module V1
  class TodoResource < JSONAPI::Resource
    model_name 'Todo'
    attributes :task, :description, :complete, :updated_at
  end
end
