class UserProfile < ActiveRecord::Base

  #relations
  belongs_to :user
  belongs_to :state
  belongs_to :division

  belongs_to :district

  belongs_to :block
  belongs_to :panchayat

  #validations
  validates :state_id,:division_id,:district_id,:block_id,:panchayat_id, :presence => true
end
