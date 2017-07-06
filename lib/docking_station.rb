
require_relative 'bike'


class DockingStation

    attr_reader :capacity

    DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
      @capacity = capacity
      @bikes = []
    end

    def release_bike
      fail 'No bikes available' if empty?
      fail 'No working bikes available' if @bikes.reject{|bike| bike.working == false}.empty?
      #return an array of working bikes(filter out broken bikes)
      popped_bike = @bikes.reject{|bike| bike.working == false}.pop
      #return a working bike from the array
      @bikes.delete(popped_bike)
    end

    def dock(bike)

      fail 'There is no space to dock' if full?
      @bikes << bike
      #puts "#{bike} has been docked."
    end

    private

      attr_reader :bikes



      def full?
        return true if @bikes.count >= @capacity #refactor
      end


      def empty?
        return true if @bikes.count == 0
      end

end
