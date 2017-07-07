require 'van'
require 'docking_station'
require 'bike'

describe Van do
  let(:docking_station) {DockingStation.new}
  let(:bike1) {Bike.new}
  let(:bike2) {Bike.new}

  before(:example) do
    bike1.report_broken
    docking_station.dock(bike1)
    docking_station.dock(bike2)
  end

  it { is_expected.to respond_to(:collect_broken_bikes) }
  it { is_expected.to respond_to(:broken_bikes) }

  describe '#initialize' do
    it 'van should start with an empty array' do
      expect(subject.broken_bikes).to eq []
    end
  end

  describe '#collect_broken_bikes' do
    before(:example) do
      subject.collect_broken_bikes(docking_station)
    end

    it 'removes broken bikes from a station' do
      expect(docking_station.bikes).not_to include(bike1)
    end

    it 'stores broken bikes in a van' do
      expect(subject.broken_bikes).to include(bike1)
    end

  end
end
