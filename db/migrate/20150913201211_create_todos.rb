class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task, null: false
      t.text :description
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
