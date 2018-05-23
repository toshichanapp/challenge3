class HousesController < ApplicationController
  
  def index
    houses = House.all

    cities = houses.pluck(:city).uniq
    @population = {}
    cities.each do |city|
      @population[city] = houses.where(city: city).pluck(:num_of_people).reduce(&:+)
    end

    @has_child = {}
    @has_child['has'] = houses.where(has_child: true).length
    @has_child['none'] = houses.where(has_child: false).length
  end
end
