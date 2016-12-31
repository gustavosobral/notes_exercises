class Zombie < ActiveRecord::Base
  validates :name, presence: true

  def avatar_url
    "http://zombitar.com/#{id}.jpg"
  end
end
