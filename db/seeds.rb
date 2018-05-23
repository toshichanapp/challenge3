require 'csv'

cities = []
CSV.foreach('db/house_data.csv', headers: true) do |row|
  cities << row['City']
end
cities.uniq.each do |city|
  ActiveRecord::Base.transaction do
    City.create(name: city)
  end
end

CSV.foreach('db/house_data.csv', headers: true) do |row|
  ActiveRecord::Base.transaction do
    has_child = row['has_child'] == 'Yes'
    House.create(city_id: City.find_by(name: row['City']).id,
                 firstname: row['Firstname'],
                 lastname: row['Lastname'],
                 num_of_people: row['num_of_people'],
                 has_child: has_child
                 )
  end
end

CSV.foreach('db/dataset_50.csv', headers: true) do |row|
  ActiveRecord::Base.transaction do
    Dataset.create(house_id: row['House'],
                   label: row['Label'],
                   year: row['Year'],
                   month: row['Month'],
                   temperature: row['Temperature'],
                   daylight: row['Daylight'],
                   energy_production: row['EnergyProduction']
                  )
  end
end
