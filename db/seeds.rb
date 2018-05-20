# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

CSV.foreach('db/house_data.csv', headers: true) do |row|
  has_child = row['has_child'] == 'Yes'
  House.create(firstname: row['Firstname'],
               lastname: row['Lastname'],
               city: row['city'],
               num_of_people: row['num_of_people'],
               has_child: has_child
              )
end
