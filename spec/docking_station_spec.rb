require "docking_station"
require "bike"

describe DockingStation do
  describe '#release_bike' do
    it "responds to release_bike method " do
      expect(subject).to respond_to(:release_bike)
    end
    it "If there are no bikes, release_bike raises an error" do
        expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  describe '#dock' do
    it "responds to #dock method" do
      expect(subject).to respond_to(:dock)
    end
    it "If there is a bike, dock raises an error" do
      subject.dock(Bike.new)
      expect { subject.dock(Bike.new) }.to raise_error 'There is no space to dock'
    end
  end
end
