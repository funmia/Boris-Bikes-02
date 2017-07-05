require "docking_station"

describe DockingStation do
  describe '#release_bike' do
    it "responds to release_bike method " do
      expect(subject).to respond_to(:release_bike)
    end
  end
end
