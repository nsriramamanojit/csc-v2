class Assignment < ActiveRecord::Base
  #Relations
  belongs_to :role
  belongs_to :user

  #validations

end
