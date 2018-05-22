class HousesController < ApplicationController
  
  def index
    houses = House.all
    cities = houses.pluck(:city).uniq
    @population = {}
    @has_child = {}
    cities.each do |city|
      @population[city] = houses.where(city: city).pluck(:num_of_people).reduce(&:+)
      @has_child[city] = houses.where(city: city, has_child: true).length
    end
    
  end
end
