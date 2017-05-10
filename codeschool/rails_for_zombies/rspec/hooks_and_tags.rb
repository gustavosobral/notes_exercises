## Shared examples

# spec/mode/zombie_spec.rb
describe Zombie do
  it_behaves_like 'the undead', Zombie.new
end

# spec/support/shared_examples_for_undead.rb
shared_examples_for 'the undead' do |undead|
  it 'does not have a pulse' do
    undead.pulse.should == false
  end
end

## Metadata and filters

describe Zombie do
  context 'when hungry' do
    it 'wants brains'
    context 'with a veggie preference', focus: true do
      it 'still craves brains', slow: true
      it 'prefers vegan brains' , vegan: true
    end
  end
end

$ rspec --tag focus spec/lib/zombie_spec.rb
$ rspec --tag ~slow spec/lib/zombie_spec.rb

# spec/spec_helper.rb
RSpec.configure do |config| 
  config.filter_run focus: true 
  config.filter_run_excluding slow: true
  cofig.run_all_when_everything_filtered = true  
end
