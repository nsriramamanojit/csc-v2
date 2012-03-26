class Panchayat < ActiveRecord::Base
  #relations
  belongs_to :state
  belongs_to :division
  belongs_to :district
  belongs_to :block

  #validations
  validates :state_id, :presence => true
  validates :division_id, :presence => true
  validates :district_id, :presence => true
  validates :block_id, :presence => true
  validates :name, :presence => true, :length => {:maximum => 100}

  #search and recent
  class << self
    def recent
      order('created_at DESC').limit(4)
    end

    def search(query)
      if query
        #where(:name.matches => "%#{query}%") #from meta_where gem
        joins(:state, :division,:district,:block).where({:name.matches => "%#{query}%"}|{:states => [:name.matches => "%#{query}%"]}|{:divisions => [:name.matches => "%#{query}%"]}| {:districts => [:name.matches => "%#{query}%"]}|{:blocks => [:name.matches => "%#{query}%"]})
      else
        scoped
      end
    end
    def active
      where(:status => true).order('name ASC')
    end
  end      # end of class self

end
