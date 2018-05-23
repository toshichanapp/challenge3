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

  def show
    @house = House.find(params[:id])
    @datasets = @house.datasets
    @x = ['x']
    @column = ['enegy_production']
    @daylight = ['daylight']

    @datasets.each do |data|
      @x << "#{data.year}-#{sprintf('%02d', data.month)}-00"
      @column << data.energy_production
      @daylight << data.daylight
    end
  end
end
