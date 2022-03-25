require_relative 'book_store'
require 'byebug'

RSpec.describe BookStore do
  subject { described_class.calculate_price(basket) }

  context 'with only one book' do
    let(:basket) { [1] }

    it 'calculate right price' do
      expect(subject).to eq(8.00)
    end
  end

  context 'with two of the same book' do
    let(:basket) { [2, 2] }

    it 'calculate right price' do
      expect(subject).to eq(16.00)
    end
  end

  context 'with empty basket' do
    let(:basket) { [] }

    it 'calculate right price' do
      expect(subject).to eq(0.00)
    end
  end

  context 'with two different books' do
    let(:basket) { [1, 2] }

    it 'calculate right price' do
      expect(subject).to eq(15.20)
    end
  end

  context 'with three different books' do
    let(:basket) { [1, 2, 3] }

    it 'calculate right price' do
      expect(subject).to eq(21.60)
    end
  end
end
