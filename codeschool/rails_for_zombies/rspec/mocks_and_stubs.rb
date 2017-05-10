describe Zombie do
  let (:zombie) { Zombie.create }

  context '#decapitate' do
    # Mock
    it 'calls weapon.slice' do
      zombie.weapon.should_receive(:slice)
      zombie.decapitate
    end

    # Stub
    it 'sets status to dead again' do
      zombie.weapon.stub(:slice)
      zombie.decapitate
      zombie.status.should == 'dead again'
    end
  end
end

# Stub a object
def geolocate_with_object
  loc = Zoogle.graveyard_locator(self.graveyard)
  "#{loc.latitude}, #{loc.longitude}"
end

it 'returns a properly formatted lat, long' do
  loc = stub(latitude: 2, longitude: 3)
  Zoogle.stub(graveyard_locator).returns(loc)
  zombie.geolocate_with_object.should == '2, 3'
end
