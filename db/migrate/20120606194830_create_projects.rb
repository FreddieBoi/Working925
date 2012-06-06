class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, :null => false
      t.text :desc
      t.string :slug

      t.timestamps
    end
    add_index :projects, :slug, unique: true
  end
end
