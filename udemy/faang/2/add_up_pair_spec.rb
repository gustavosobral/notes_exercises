require_relative 'add_up_pair'

RSpec.describe AddUpPair do
  subject { described_class.process(array, target) }

  let(:array) { [] }
  let(:target) { 13 }

  context "With a solution" do
    context "example 1" do
      let(:array) { [1, 3, 7, 9, 2] }
      let(:target) { 11 }

      it "returns the rightful result" do
        expect(subject).to eq([3, 4])
      end
    end

    context "example 2" do
      let(:array) { [1, 6] }
      let(:target) { 7 }

      it "returns the rightful result" do
        expect(subject).to eq([0, 1])
      end
    end
  end

  context "Without a solution" do
    let(:array) { [1, 2] }

    it "returns nil" do
      expect(subject).to eq(nil)
    end
  end

  context "With an array with one element" do
    let(:array) { [13] }

    it "returns nil" do
      expect(subject).to eq(nil)
    end
  end

  context "With an empty array" do
    it "returns nil" do
      expect(subject).to eq(nil)
    end
  end
end
