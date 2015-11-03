class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.date :list_due_date
      t.string :list_name

      t.timestamps null: false
    end
  end
end
