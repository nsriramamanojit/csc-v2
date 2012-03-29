class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      #User Details
      t.string :email
      t.string :name
      t.string :father_name
      t.string :gender
      t.date :dob
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :place
      t.string :pin
      t.string :mobile_number
      t.string :phone_number

      #for mobile verification
      t.string :verification_code
      t.string :verification_date

      #Password and Login Details
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token, :null => false
      t.string :perishable_token, :default => "", :null => false
      t.integer :login_count, :default => 0, :null => false
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
      t.boolean :status, :default => 0

      #profile picture
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at


      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
