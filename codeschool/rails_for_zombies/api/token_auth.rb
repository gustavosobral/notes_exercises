# listing_episodes_test.rb
class ListingEpisodesTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!
  end

  def token_header(token)
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

  test 'valid authentication with token' do
    get '/episodes', {}, { 'Authorization' => token_header(@user.auth_token) }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'invalid authentication' do
    get '/episodes', {}, { 'Authorization' => @auth_header + 'fake' }
    assert_equal 401, response.status
  end
end

# user.rb
class User < ActiveRecord::Base
  before_create :set_auth_token

  private
  
  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(auth_token: token)
    end
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
    authenticate_token || render_unauthorized    
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Episodes"'
    respond_to do |format|
      format.json { render json: 'Bad credentials', status: 401 }
      format.xml { render xml: 'Bad credentials', status: 401 }
    end
  end
end
