require "bike.rb"

describe Bike do
  describe '#working' do
    it { is_expected.to respond_to(:working) }
  end

  describe '#initialize' do
    it 'creates a working bike' do
      expect(subject.working).to eq true
    end
  end

  describe '#report_broken' do
    it { is_expected.to respond_to(:report_broken) }

    it "can report the bike as not working" do
      subject.report_broken
      expect(subject.working).to eq false
    end
  end
end
