class Van
  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def collect_broken_bikes(station)
    station.bikes.each { |bike| bike.working == false ? @broken_bikes << bike : nil }
    station.release_broken_bikes
    @broken_bikes
  end

  # def
  #
  # end
end
