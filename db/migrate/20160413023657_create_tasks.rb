class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :start
      t.datetime :finish
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tasks, [:user_id, :created_at]
  end
end
