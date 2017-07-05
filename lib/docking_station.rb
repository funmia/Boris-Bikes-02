
require_relative 'bike'


class DockingStation

    attr_reader :bikes

    def initialize
      @bikes = []

    end

    def release_bike
      fail 'No bikes available' unless @bikes.count > 0
      @bikes.pop
    end

    def dock(bikes)
      fail 'There is no space to dock' if @bikes.count == 20
      @bikes << bikes
      puts "#{bikes} has been docked."
    end
end
