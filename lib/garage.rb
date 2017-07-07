class Garage
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def receive_bikes(van)
    van.bikes.each { |bike| @bikes << bike }
  end

  def fix_bikes
    @bikes.each { |bike| bike.fix }
  end

end
