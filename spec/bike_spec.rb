require "bike.rb"

describe Bike do
  describe '#working' do
    it "responds to #working" do
      expect(subject).to respond_to :working
    end
    it "can report the bike as not working" do
      subject.report_broken
      expect(subject.working).to eq(false)
    end
  end
end
