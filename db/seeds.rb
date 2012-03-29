############# Roles ###############
Role.create(:name => "super_admin", :reference_code => "sa", :description => "Super Admin", :created_at => Time.now, :created_by => 1)
Role.create(:name => "admin", :reference_code => "ad", :description => "Admin", :created_at => Time.now, :created_by => 1)
Role.create(:name => "manager", :reference_code => "ma", :description => "Manager", :created_at => Time.now, :created_by => 1)
Role.create(:name => "vle", :reference_code => "vl", :description => "VLE", :created_at => Time.now, :created_by => 1)
Role.create(:name => "district_manager", :reference_code => "dm", :description => "District Manager", :created_at => Time.now, :created_by => 1)
Role.create(:name => "district_engineer", :reference_code => "de", :description => "District Engineer", :created_at => Time.now, :created_by => 1)
Role.create(:name => "dlf_agent", :reference_code => "dl", :description => "DLF Agent", :created_at => Time.now, :created_by => 1)
