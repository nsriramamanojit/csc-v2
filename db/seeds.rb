############# Roles ###############
Role.create(:name => "super", :reference_code => "su", :description => "Super Admin", :created_at => Time.now, :created_by => 1)
Role.create(:name => "admin", :reference_code => "ad", :description => "Admin", :created_at => Time.now, :created_by => 1)
Role.create(:name => "manager", :reference_code => "ma", :description => "Manager", :created_at => Time.now, :created_by => 1)
Role.create(:name => "vle", :reference_code => "vl", :description => "VLE", :created_at => Time.now, :created_by => 1)
Role.create(:name => "district_manager", :reference_code => "dm", :description => "District Manager", :created_at => Time.now, :created_by => 1)
Role.create(:name => "district_engineer", :reference_code => "de", :description => "District Engineer", :created_at => Time.now, :created_by => 1)
Role.create(:name => "dlf_agent", :reference_code => "dl", :description => "DLF Agent", :created_at => Time.now, :created_by => 1)
#####
session = User.create do |u|
  u.name = "Super Admin"
  u.email = 'superadmin@vedavaagcsc.in'
  u.password = 'admin123'
  u.address1= 'Super Admin'
  u.mobile_number=9885976490
  Assignment.create(:user_id => 1, :role_id => 1, :created_at => Time.now, :updated_at => Time.now)
end
session.save
session = User.create do |u|
  u.name = "Admin"
  u.email = 'admin@vedavaagcsc.in'
  u.password = 'admin123'
  u.address1= 'Admin'
  u.mobile_number=9885976490
  Assignment.create(:user_id => 2, :role_id => 2, :created_at => Time.now, :updated_at => Time.now)
end
session.save
session = User.create do |u|
  u.name = "Manager"
  u.email = 'manager@vedavaagcsc.in'
  u.password = 'admin123'
  u.address1= 'Manager'
  u.mobile_number=9885976490
  Assignment.create(:user_id => 3, :role_id => 3, :created_at => Time.now, :updated_at => Time.now)
end
session.save
