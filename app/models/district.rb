class District < ActiveRecord::Base
  #relations
  belongs_to :state
  belongs_to :division

  #validations
  validates :state_id, :presence => true
  validates :division_id, :presence => true
  validates :name, :presence => true, :uniqueness => true, :length => {:maximum => 100}
  validates :short_code, :presence => true, :uniqueness => true, :length => {:maximum => 5}
  #search and recent
  class << self
    def recent
      order('created_at DESC').limit(4)
    end

    def search(query)
      if query
        #where(:name.matches => "%#{query}%") #from meta_where gem
        joins(:state, :division).where({:name.matches => "%#{query}%"}|{:states => [:name.matches => "%#{query}%"]}|{:divisions => [:name.matches => "%#{query}%"]})
      else
        scoped
      end
    end
  end

end
