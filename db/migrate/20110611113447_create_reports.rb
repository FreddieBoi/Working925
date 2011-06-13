class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.date :worked_on, :null => false, :default => Date.today
      t.time :started_at, :null => false, :default => Time.gm(2000,1,1,9,0)
      t.time :left_at, :null => false, :default => Time.gm(2000,1,1,17,0)
      t.integer :lunch_for, :null => false, :default => 60
      t.integer :away_for, :null => false, :default => 0
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
