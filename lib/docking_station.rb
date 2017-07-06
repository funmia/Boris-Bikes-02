
require_relative 'bike'


class DockingStation

    attr_reader :bikes

    DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
      @capacity = capacity
      @bikes = []
    end

    def release_bike
      fail 'No bikes available' if empty?
      @bikes.pop
    end

    def dock(bike)

      fail 'There is no space to dock' if full?
      @bikes << bike
      #puts "#{bike} has been docked."
    end

    private

      def full?
        return true if @bikes.count >= @capacity
      end


      def empty?
        return true if @bikes.count == 0
      end

end
