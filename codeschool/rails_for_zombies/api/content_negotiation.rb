### IMPLEMENTATION
class ZombiesController < ApplicationController
  def index
    zombies = Zombie.all

    respond_to do |format|
      format.json { render json: zombies, status: 200 }
      format.xml { render xml: zombies, status: 200 }
    end
  end
end

### SPEC
class ListingZombiesTest < ActionDispatch::IntegrationTest
  test 'returns zombies in JSON' do
    get '/zombies', {}, { 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'returns zombies in XML' do
    get '/zombies', {}, { 'Accept' => Mime::XML }
    assert_equal 200, response.status
    assert_equal Mime::XML, response.content_type
  end
end
