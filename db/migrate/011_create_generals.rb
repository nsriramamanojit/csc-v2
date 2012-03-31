class CreateGenerals < ActiveRecord::Migration
  def self.up
    create_table :generals do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :generals
  end
end
