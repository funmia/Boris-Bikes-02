require_relative 'bike'

class DockingStation
    attr_reader :bike
    def release_bike
      fail 'No bikes available' unless @bike
      @bike
    end
    def dock(bike)
      fail 'There is no space to dock' if @bike
      @bike = bike
      puts "#{@bike} has been docked."
    end
end
