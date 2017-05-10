# Predicates
class Zombie
  def hungry?
    true
  end
end

describe Zombie do
  it 'is hungry' do
    zombie = Zombie.new
    zombie.should be_hungry
  end
end


# Pending
describe Zombie do
  it 'pending'

  xit 'also pending' do
    ...
  end

  it 'pending too' do
    pending
    ...
  end
end
