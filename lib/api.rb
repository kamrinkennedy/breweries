require 'pry'



class API
    def self.fetch_breweries(state)

        url = "https://api.openbrewerydb.org/breweries?by_state=#{state}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        brewery_array = JSON.parse(response)
      

        brewery_array.each.with_index do |hash, index|
            brewery_instance = Brewery.new
            brewery_instance.name = hash["name"]
            brewery_instance.city = hash["city"]
            brewery_instance.state = hash["state"]
            brewery_instance.street = hash["street"]
            brewery_instance.website_url = hash["website_url"]
            brewery_instance.brewery_type = hash["brewery_type"]
            brewery_instance.phone = hash["phone"]
            # binding.pry 
            
        end
        # binding.pry
    end
end