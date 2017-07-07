class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_broken_bikes(station)
    station.bikes.each { |bike| bike.working == false ? @bikes << bike : nil }
    station.release_broken_bikes
    @bikes
  end

  def deliver_broken_bikes(garage)
    garage.receive_bikes(self)
    @bikes = []
  end

end
