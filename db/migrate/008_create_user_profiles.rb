class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|

      t.integer :user_id
      t.integer :state_id
      t.integer :division_id
      t.integer :district_id
      t.integer :block_id
      t.integer :panchayat_id

      t.string  :csc_code         # CSC Code provided by Govt.
      t.string  :vle_code         # For Vedavaag Reference.

      t.float   :balance,:default=>0
      t.string  :payment_mode
      t.string  :bank_name
      t.string  :branch
      t.integer :instrument_number
      t.date    :instrument_date

      t.text    :remarks

      #user ID Proof
      t.string :id_proof_file_name
      t.string :id_proof_content_type
      t.integer :id_proof_file_size
      t.datetime :id_proof_updated_at

      #user Agreement Files
      t.string :agreement1_file_name
      t.string :agreement1_file_name
      t.integer :agreement1_file_size
      t.datetime :agreement1_updated_at

      t.string :agreement2_file_name
      t.string :agreement2_file_name
      t.integer :agreement2_file_size
      t.datetime :agreement2_updated_at

      t.string :agreement3_file_name
      t.string :agreement3_file_name
      t.integer :agreement3_file_size
      t.datetime :agreement3_updated_at

      t.string :agreement4_file_name
      t.string :agreement4_file_name
      t.integer :agreement4_file_size
      t.datetime :agreement4_updated_at

      t.string :agreement5_file_name
      t.string :agreement5_file_name
      t.integer :agreement5_file_size
      t.datetime :agreement5_updated_at

      t.string :agreement6_file_name
      t.string :agreement6_file_name
      t.integer :agreement6_file_size
      t.datetime :agreement6_updated_at

      t.string :agreement7_file_name
      t.string :agreement7_file_name
      t.integer :agreement7_file_size
      t.datetime :agreement7_updated_at

      t.string :agreement8_file_name
      t.string :agreement8_file_name
      t.integer :agreement8_file_size
      t.datetime :agreement8_updated_at


      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
