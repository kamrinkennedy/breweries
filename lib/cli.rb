class CLI

    def start
        puts "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _"
        puts "Welcome!"
        puts "To exit the program, type 'exit'."
        puts "Please type the name of a state to view its breweries:"
        
        input = gets.strip.downcase.gsub(" ", "_")
        if input == "exit"
            return
        else
        until API.fetch_breweries(input) != []
            puts "Invalid choice, please try again:"
            input = gets.strip.downcase.gsub(" ", "_")
        end
        
        brewery_display
        user_selection
        sleep 8
        start
        end
    end

    def brewery_display
       
        Brewery.all.each.with_index(1) do |brewery, index|
            
            puts "#{index}. #{brewery.name} - #{brewery.city}"
            puts "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _"
              
        end

        puts "For more information on a brewery, type its associated number:"
    end

    def user_selection
        index = gets.strip.to_i - 1
        until index.between?(0, Brewery.all.length - 1)
            puts "Invalid choice, please try again:"
        end
        brewery_instance = Brewery.all[index]
        formatted_number = brewery_instance.phone.insert(0, "(").insert(4, ")").insert(8, "-")
        puts "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _"
        puts "#{brewery_instance.name}"
        puts "Brewery Type: #{brewery_instance.brewery_type.capitalize}"
        puts "Location: #{brewery_instance.street} --- #{brewery_instance.city}, #{brewery_instance.state}"
        puts "Phone Number: #{formatted_number}"
        puts "Website: #{brewery_instance.website_url}"  if brewery_instance.website_url != ''

    end

end

