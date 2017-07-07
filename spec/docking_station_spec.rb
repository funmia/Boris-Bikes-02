require "docking_station"
require "bike"

describe DockingStation do

  let(:bike) { double :bike }

  describe '#release_bike' do

    it { is_expected.to respond_to(:release_bike)}
    it "If there are no bikes, release_bike raises an error" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
    it "doesn't release broken bikes" do
      allow(bike).to receive(:report_broken)
      allow(bike).to receive(:working).and_return(false)
      bike1 = bike
      bike1.report_broken
      subject.dock(bike1)
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end
    it 'removes bike from the docking station when it is released' do
      allow(bike).to receive(:working).and_return(true)
      subject.dock(bike)
      subject.release_bike
      expect(subject.bikes.length).to eq 0
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock)}
    it "If the dock is full, dock raises an error" do
      subject.capacity.times{subject.dock(bike)}
      expect { subject.dock(bike) }.to raise_error 'There is no space to dock'
    end
  end
  describe '#initialize' do
    it "stores the argument as the capacity variable" do
      expect(DockingStation.new(10).capacity).to eq 10
    end
    it "has a default capacity of 20 " do
      expect(subject.capacity).to eq 20
    end
  end

  describe '#release_broken_bikes' do
    it { is_expected.to respond_to(:release_broken_bikes) }
  end


end
