def nyc_pigeon_organizer(data)
  pigeons = {}
  
  pigeon_names = get_pigeon_names(data)
  
  
  return pigeons
end


def get_pigeon_names(data)
  
  all_names = data.reduce([]) { |memo, (category,fact) |
    memo << fact.reduce([]) { |memo, (option,names) |
      memo << names
    }
  }
  
  return all_names.flatten.uniq
end

def get_pigeon_info(data, name)
  pigeon = {}
  
  # info = data.reduce({}) { |memo, (category, fact) |
  #   memo[category] = fact.reduce{ |memo, (option, names) | 
      
  #   }
  # }
  
  info = {}
  data.each do |category, fact|
    categories = fact.reduce([]) { |memo, (option, names)| 
      # p option
      # p names
      if names.include?(name)
        memo << option.to_s
      end
    }
    
    # p categories
    # fact = 
  end
  
  pigeon[name] = info
  # p pigeon
end



test_data = {
  :color => {
    :brown => ["Luca"],
    :black => ["Lola"],
  },
  :gender => {
    :male => ["Luca"],
    :female => ["Lola"]
  },
  :lives => {
    "Central Park" => ["Lola"],
    "Library" => ["Luca"],
  }
}

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

get_pigeon_info(pigeon_data, "Peter Jr.")

