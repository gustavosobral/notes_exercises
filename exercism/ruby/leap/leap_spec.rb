require_relative 'leap_calculator'

RSpec.describe LeapCalculator do
  it 'calculates proper year result' do
    expect(Leap.new(1997).result).to eq(false)
  end

  it 'calculates proper year result' do
    expect(Leap.new(1996).result).to eq(true)
  end

  it 'calculates proper year result' do
    expect(Leap.new(1900).result).to eq(false)
  end

  it 'calculates proper year result' do
    expect(Leap.new(2000).result).to eq(true)
  end
end
