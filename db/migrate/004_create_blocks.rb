class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|

      t.integer :state_id
      t.integer :division_id
      t.integer :district_id
      t.string  :name
      t.string  :description
      t.string  :short_code

      t.boolean :status,:default=>0

      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :blocks
  end
end
