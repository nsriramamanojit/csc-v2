class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name
      t.string :reference_code
      t.string :description
      t.boolean :status,:default=>0

      t.integer :created_by
      t.integer :modified_by


      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end
