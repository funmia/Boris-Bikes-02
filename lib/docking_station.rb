require_relative 'bike'
require 'van'
require 'garage'

class DockingStation

    attr_reader :capacity, :bikes

    DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
      @capacity = capacity
      @bikes = []
    end

    def release_bike
      fail 'No bikes available' if empty?
      fail 'No working bikes available' if working_bike_array.empty?
      @bikes.delete(working_bike_array.pop)
    end

    def dock(bike)
      fail 'There is no space to dock' if full?
      @bikes << bike
      #puts "#{bike} has been docked."
    end

    def release_broken_bikes
      @bikes.reject! { |bike| bike.working == false }
    end

    private

      def working_bike_array
        #filter out broken bikes and return array
        @bikes.select(&:working)
      end

      def full?
        @bikes.count >= @capacity
      end


      def empty?
        @bikes.count == 0
      end
end

require './lib/bike.rb'
require './lib/van.rb'
require './lib/garage.rb'
ds = DockingStation.new
bike1 = Bike.new
bike2 = Bike.new
bike3 = Bike.new
bike4 = Bike.new
bike5 = Bike.new
bike6 = Bike.new
bike1.report_broken
bike4.report_broken
bike6.report_broken
ds.dock(bike1)
ds.dock(bike2)
ds.dock(bike3)
ds.dock(bike4)
ds.dock(bike5)
ds.dock(bike6)
van = Van.new
van.collect_broken_bikes(ds)
garage = Garage.new
van.deliver_broken_bikes(garage)
van.bikes # => []
garage.bikes # => an array of broken bikes
garage.fix_bikes
garage.bikes # => an array of fixed bikes
