require 'pp'

def get_pigeon_names(data)
  
  all_names = data.reduce([]) { |memo, (category,fact) |
    memo << fact.reduce([]) { |memo, (option,names) |
      memo << names
    }
  }
  
  return all_names.flatten.uniq
end

def get_pigeon_info(data, name)
  
  # info = data.reduce({}) { |memo, (category, fact) |
  #   memo[category] = fact.reduce{ |memo, (option, names) | 
      
  #   }
  # }
  
  info = {}
  
  data.each do |category, fact|
    # categories = fact.reduce([]) { |memo, (option, names)| 
    #   # p option
    #   # p names
    #     memo << option.to_s if names.include?(name) # this breaks the code
    # }
    
    info[category] = []
    fact.each do |option, names|
      info[category] << option.to_s if names.include?(name)  
    end
    
    
  end
  
  return info
end

def nyc_pigeon_organizer(data)
  pigeons = {}
  
  pigeon_names = get_pigeon_names(data)
  
  for name in pigeon_names do
    pigeons[name] = get_pigeon_info(data, pigeon_names)
  end
  
  return pigeons
end


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

# nyc_pigeon_organizer(pigeon_data)
p get_pigeon_info(pigeon_data, "Peter Jr.")

