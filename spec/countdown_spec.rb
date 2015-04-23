require '21_day_challenge_countdown'
describe TwentyOneDayChallenge::Countdown do
  context "creation" do
    it "can be initialized with date" do
      expect(described_class.new(DateTime.new)).to be_a(TwentyOneDayChallenge::Countdown)
    end

    it "expects anchor to use default time" do
      expect(subject.anchor).to eq(DateTime.new(2015,4,13,12,0,0,'-6'))
    end
  end

  context "calculation" do
    it "10th day is calculated correctly" do
      allow(Time).to receive(:now).and_return(Time.new(2015,4,23,11,0,0))
      expect(subject.current_day).to eq(10)
    end
    it "1st day is calculated correctly" do
      allow(Time).to receive(:now).and_return(Time.new(2015,4,14,11,0,0))
      expect(subject.current_day).to eq(1)
    end

    it "calculates 1hr remaining in Mountain Time time correctly" do
      allow(Time).to receive(:now).and_return(Time.new(2015,4,14,11,0,0,"-06:00"))
      expect(subject.time_left.to_i).to eq(3600)
    end

    it "calculates 30min remaining in UTC time correctly" do
      allow(Time).to receive(:now).and_return(Time.new(2015,4,16,17,30,0,"+00:00"))
      expect(subject.time_left.to_i).to eq(30*60)
    end

  end
end
