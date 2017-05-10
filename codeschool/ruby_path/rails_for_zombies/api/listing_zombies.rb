### IMPLEMENTATION
module API
  class ZombiesController < ApplicationController
    def index
      zombies = Zombie.all
      render json: zombies, status: 200
    end
  end
end

### SPEC
require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' } # Required for testing with subdomain

  test 'returns list of all zombies' do
    get '/zombies'
    assert_equal 200, response.status
    refute_empty response.body
  end
end
