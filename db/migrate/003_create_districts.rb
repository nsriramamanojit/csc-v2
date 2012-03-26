class CreateDistricts < ActiveRecord::Migration
  def self.up
    create_table :districts do |t|
      t.integer :state_id
      t.integer :division_id
      t.string  :name
      t.string  :description
      t.string  :short_code

      t.integer :dis_number, :default=>0     #increment the VLE Code District Wise

      t.boolean :status, :default=>0

      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :districts
  end
end
