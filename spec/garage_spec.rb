require 'garage'

describe Garage do

  let(:docking_station) {DockingStation.new}
#  let(:garage) {Garage.new}
  let(:bike1) {Bike.new}
  let(:bike2) {Bike.new}
  let(:van) {Van.new}

  before(:example) do
    bike1.report_broken
    docking_station.dock(bike1)
    docking_station.dock(bike2)
    van.collect_broken_bikes(docking_station)
  end

  it { is_expected.to respond_to(:bikes) }

  it { is_expected.to respond_to(:receive_bikes) }

  it { is_expected.to respond_to(:fix_bikes) }

  describe '#initialize' do
    it 'should start with an empty array' do
      expect(subject.bikes).to eq []
    end
  end

  describe '#fix_bikes' do
    before(:example) do
      van.deliver_broken_bikes(subject)
    end

    it 'returns an array of fixed bikes' do
      subject.fix_bikes
      expect(subject.bikes.to_s).not_to include('@working=false')
    end

  end

end
