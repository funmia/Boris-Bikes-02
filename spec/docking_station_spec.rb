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
      subject.instance_variable_get(:@capacity).times{subject.dock(Bike.new)}
      expect { subject.dock(Bike.new) }.to raise_error 'There is no space to dock'
    end
  end

  describe '#new' do
    it "stores the argument as the capacity variable" do
      docking_station = DockingStation.new(10)
      expect(docking_station.instance_variable_get(:@capacity)).to eq 10
    end
    it "has a default capacity of 20 " do
      docking_station = DockingStation.new
      expect(docking_station.instance_variable_get(:@capacity)).to eq 20
    end
    it "sets the capacity to the capacity variable" do
      docking_station = DockingStation.new(1)
      docking_station.dock(Bike.new)
      expect { docking_station.dock(Bike.new) }.to raise_error 'There is no space to dock'
    end
  end
end
