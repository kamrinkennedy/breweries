class CLI

    def start
        puts Rainbow("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _").blue
        puts Rainbow("Welcome!").coral
        puts Rainbow("To exit the program, type 'exit'.").coral
        puts Rainbow("Please type the name of a state or city in the U.S. to view its breweries:").coral
        Brewery.clear
        input = gets.strip.downcase.gsub(" ", "_")
        if input == "exit"
            return
        else
        until API.fetch_breweries(input) != []
            return if input == "exit"
            puts Rainbow("Invalid choice, please try again:").maroon
            input = gets.strip.downcase.gsub(" ", "_")
        end
        
        brewery_display
        user_selection
        sleep 5
        start
        end
    end

    def brewery_display
       
        Brewery.all.each.with_index(1) do |brewery, index|
            
            puts Rainbow("#{index}. ").blanchedalmond + Rainbow("#{brewery.name} ").maroon + Rainbow("- #{brewery.city}").turquoise
            puts Rainbow("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _").blue
              
        end

        puts Rainbow("For more information on a brewery, type its associated number:").coral
    end

    def user_selection
        input = gets.strip
        return if input.downcase == 'exit'
        index = input.strip.to_i - 1
        until index.between?(0, Brewery.all.length - 1)
            puts Rainbow("Invalid choice, please try again:").maroon
            index = gets.strip.to_i - 1
        end
        
        brewery_instance = Brewery.all[index]

        if brewery_instance.phone != ''
            formatted_number = brewery_instance.phone.insert(0, "(").insert(4, ")").insert(8, "-") 
        end 

        puts Rainbow("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _").blue
        puts Rainbow("#{brewery_instance.name}").maroon
        puts Rainbow("Brewery Type: ").blanchedalmond + Rainbow("#{brewery_instance.brewery_type.capitalize}").turquoise
        puts Rainbow("Location: ").blanchedalmond + Rainbow("#{brewery_instance.street} --- #{brewery_instance.city}, #{brewery_instance.state}").turquoise
        puts Rainbow("Phone Number: ").blanchedalmond + Rainbow("#{formatted_number}").turquoise if formatted_number != nil
        puts Rainbow("Website: ").blanchedalmond + Rainbow("#{brewery_instance.website_url}").turquoise  if brewery_instance.website_url != ''

    end

end

