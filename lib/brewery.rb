class Brewery
    attr_accessor :name, :street, :city, :state, :website_url, :brewery_type, :phone 
  

    @@all = []

    def initialize 
        @@all << self
    end

    def self.all
        @@all 
    end


end