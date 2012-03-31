class User < ActiveRecord::Base
  #authlogic
  acts_as_authentic do |c|
    c.require_password_confirmation= false
    c.validate_password_field= false
    c.email_field =false
    c.validate_email_field = false
  end

  #validations
  validates :name, :father_name, :dob, :gender,:presence => true, :length => {:maximum => 100}
  validates :mobile_number, :presence => true, :length => {:maximum => 10} #,:uniqueness => true
  validates :phone_number, :length => {:maximum => 11}
  validates :pin, :length => {:maximum => 6}, :presence => true

  #relations
  has_one :user_profile
  has_many :assignments
  has_many :roles, :through => :assignments

  #Attributes for User Profile
  accepts_nested_attributes_for :user_profile, :allow_destroy => true

  #Roles
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end


  #Recent and Search
  class << self
    def recent
      order('id DESC').limit(5)
    end

    def search(query)
      if query
        where(:name.matches => "%#{query}%") #from meta_where gem
      else
        scoped
      end
    end
    def admin_users
      joins([:roles]).where(:roles => {:name => %w(vle district_manager district_engineer dlf_agent)})
    end
    def super_users
      joins([:roles]).where(:roles => {:name => %w(super admin manager)})
    end
  end
end
