class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, :null => false
      t.text :desc
      t.references :project
      t.string :slug
      t.string :status, :null => false

      t.timestamps
    end
    add_index :tasks, :project_id
    add_index :tasks, :slug, unique: true
  end
end
