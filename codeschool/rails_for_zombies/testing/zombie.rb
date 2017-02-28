class Zombie < ActiveRecord::Base
  has_one :weapon
  validates :name, presence: true  

  def avatar_url
    "http://zombitar.com/#{id}.jpg"
  end

  def decapitate
    weapon.slice(self, :head)
    self.status = 'dead again'
  end

  def geolocate
    loc = Zoogle.graveyard_locator(self.graveyard)
    "#{loc[:latitude]}, #{loc[:longitude]}"
  end

  def geolocate_with_object
    loc = Zoogle.graveyard_locator(self.graveyard)
    "#{loc.latitude}, #{loc.longitude}"
  end
end
