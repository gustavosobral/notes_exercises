require_relative 'max_area'

RSpec.describe MaxArea do
  subject { described_class.process(nums) }


  context "with valid solution" do
    context "example 1" do
      let(:nums) { [10, 10] }

      it "returns right result" do
        expect(subject).to eq(10)
      end
    end

    context "example 2" do
      let(:nums) { [4, 8, 1, 2, 9, 4] }

      it "returns right result" do
        expect(subject).to eq(24)
      end
    end
  end

  context "with empty input" do
    let(:nums)  { [] }

    it "returns zero" do
      expect(subject).to eq(0)
    end
  end

  context "with one element on input" do
    let(:nums) { [1] }

    it "returns zero" do
      expect(subject).to eq(0)
    end
  end
end
