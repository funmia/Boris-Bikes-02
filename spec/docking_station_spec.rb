require "docking_station"
require "bike"

describe DockingStation do
  describe '#release_bike' do
    it "responds to release_bike method " do
      expect(subject).to respond_to(:release_bike)
    end
    it "expects release_method to return a Bike" do
      expect(subject.release_bike).to be_instance_of(Bike)
    end
    it "expects the Bike #working?" do
      expect(subject.release_bike.working?).to be true
    end
  end
end
