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
    # it "expects the Bike #working?" do
    #   expect(subject.release_bike.working?).to be true
    # end
  end
  describe '#dock' do
    it "responds to #dock method" do
      expect(subject).to respond_to(:dock)
    end
  end
end
