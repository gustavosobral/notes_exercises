require_relative 'leap_calculator'

RSpec.describe LeapCalculator do
  describe '#leap?' do
    subject { described_class.new(year).leap? }

    context 'when year is not evenly divisable by 4' do
      let(:year) { 1997 }

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end

    context 'when year is  evenly divisable by 4' do
      let(:year) { 1996 }

      it 'returns true' do
        expect(subject).to eq(true)
      end

      context 'unless also evenly divisable by 100' do
        let(:year) { 1900 }

        it 'returns false' do
          expect(subject).to eq(false)
        end

        context 'unless also evenly divisable by 400' do
          let(:year) { 2000 }

          it 'returns true' do
            expect(subject).to eq(true)
          end
        end
      end
    end
  end
end
