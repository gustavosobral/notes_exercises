require 'test_helper' # Configuration file

class ZombieTest < ActiveSupport::TestCase

  def setup
    @z = zombies(:ash)
  end

  test 'Valid with all attributes' do
    z = Zombie.new
    z.name = 'Ash'
    z.graveyard = 'Oak Park'
    assert z.valid?, 'Zombie was not valid'
  end

  test 'Invalid name gives error message' do
    @z.name = nil
    @z.valid?
    assert_match /can't be blank/. @z.errors[:name].join,
      'Presence error not found on zombie'
  end

  test 'Invalid without a name' do
    z = Zombie.new
    assert !z.valid?, 'Name is not being validated'
  end

  test 'Can generate avatar_url' do
    assert_equal "http://zombitar.com/#{@z.id}.jpg", @z.avatar_url
  end

  test 'Should respond to tweets' do
    assert_respond_to @z, :tweets
  end

  test 'Should contain tweets' do
    assert_equal [tweets(:ash_2), tweets(:ash_1)], zombies(:ash).tweets
  end

  test 'Should contain only tweets taht belong to zombie' do
    assert @z.tweets.all? { |t| t.zombie == @z }
  end

  # shoulda gem
  should validate_presence_of(:name)
  should validate_presence_of(:graveyard)
  should ensure_length_of(:name).is_at_most(15)
  should have_many(:tweets)
end
