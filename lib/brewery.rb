class Brewery
    attr_accessor :name, :street, :city, :state, :website_url, :brewery_type
    attr_reader :phone 
  

    @@all = []

    def initialize 
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.clear
        @@all.clear
    end

    def phone=(phone) 
        @phone = phone.insert(0, "(").insert(4, ")").insert(8, "-") if phone != ''
    end

end