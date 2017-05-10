# Implicit subject and receiver
describe Zombie do
  it { should respond_to(:name) }
end

# Its
describe Zombie do
  its(:name) { should == 'Ash' }
  its(:weapons) { should.include(weapon) }
  its(:brain) { should be_nil }
  its('tweets.size') { should == 2 }
end

# Context
describe Zombie do
  context 'when hungry' do
    it 'craves brains'
    context 'with a veggie preference' do
      it 'still craves brains'
      it 'prefers vegan brains'
    end
  end
end
