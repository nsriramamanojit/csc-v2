class State < ActiveRecord::Base
  #relations
  has_many :divisions, :dependent => :destroy
  has_many :districts, :dependent => :destroy

  #validations
  validates :name, :presence => true, :uniqueness => true, :length => {:maximum => 100}
  validates :reference_code, :presence => true, :uniqueness => true, :length => {:maximum => 2}

  #search and recent
  class << self
    def recent
      order('created_at DESC').limit(4)
    end

    def search(query)
      if query
        where(:name.matches => "%#{query}%") #from meta_where gem
      else
        scoped
      end
    end

    def active
      where(:status => true).order('name ASC')
    end
  end


end
