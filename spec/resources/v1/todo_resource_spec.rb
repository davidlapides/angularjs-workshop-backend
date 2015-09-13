require 'rails_helper'

describe V1::TodoResource do
  let!(:todo) { FactoryGirl.create :todo }

  subject { described_class.new(todo) }

  it 'has task attribute' do
    expect(subject.task).to eq(todo.task)
  end

  it 'has description attribute' do
    expect(subject.description).to eq(todo.description)
  end

  it 'has complete attribute' do
    expect(subject.complete).to eq(todo.complete)
  end

  it 'has updated_at attribute' do
    expect(subject.updated_at).to eq(todo.updated_at)
  end
end
