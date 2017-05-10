# listing_episodes_test.rb
class ListingEpisotesTest < ActionDispatch::IntegrationTest
  setup { @user = User.create!(username: 'foo', password: 'secret') }

  def encode(username, password)
    ActionController::HttpAuthentication::Basic.encode_credentials(username,
  end

  test 'valid username and password' do
    get '/episodes', {}, { 'Authorization' => encode(@user.username, @user.password) }
    assert_equal 200, response.status
  end

  test 'missing credentials' do
    get '/episodes', {}, {}
    assert_equal 401, response.status
  end
end

# episodes_controller.rb
class EpisodesController < ApplicationController
  before_action :authenticate

  def index
    episodes = Episode.all
    render json: episodes, status: 200
  end

  protected
  
  def authenticate
    authenticate_basic_auth || render_unauthorized    
  end

  def authenticate_basic_auth
    authenticate_with_http_basic do |username, password|
      User.authenticate(username, password)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Basic realm="Episodes"'
    respond_to do |format|
      format.json { render json: 'Bad credentials', status: 401 }
      format.xml { render xml: 'Bad credentials', status: 401 }
    end
  end
end
