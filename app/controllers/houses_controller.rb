class HousesController < ApplicationController
  
  def index
    cities = City.all
    @population = {}
    cities.each do |city|
      @population[city.name] = city.houses.pluck(:num_of_people).reduce(&:+)
    end

    @houses = House.all
    @has_child = {}
    @has_child['has'] = @houses.where(has_child: true).length
    @has_child['none'] = @houses.where(has_child: false).length
  end
end
