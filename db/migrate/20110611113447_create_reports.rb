class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.date :worked_on
      t.time :started_at
      t.time :left_at
      t.integer :lunch_for
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
