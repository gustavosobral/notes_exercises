# test/integration/changing_api_versions_test.rb
class ChangingApiVersionsTest < ActionDispatch::IntegrationTest
  setup { @ip = '123.123.12.12' }

  test 'returns version two via Accept header' do
    get '/zombies', {},
      { 'REMOTE_ADDR' => @ip, 'Accept' => 'application/vnd.apocalypse.v2+json' }
  
    assert_equal 200, response.status
    assert_equal "#{@ip} Version Two!", response.body
    assert_equal Mime::JSON, response.content_type
  end
end

# lib/api_version.rb
class ApiVersion

  def initialize(version, default=false)
    @version, @default = version, default
  end
  
  def matches?(request)
    @default || check_headers(request.headers)
  end

  private
    def check_headers(headers)
      accept = headers['Accept']
      accept && accept.include?("application/vnd.apocalypse.#{@version}+json")
    end
end

# config/routes.rb
require 'api_version'

CodeSchoolZombies::Application.routes.draw do
  
  scope defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiVersion.new('v1') do
      resources :zombies
    end
    
    scope module: :v2, constraints: ApiVersion.new('v2', true) do
      resources :zombies
    end
  end

end
