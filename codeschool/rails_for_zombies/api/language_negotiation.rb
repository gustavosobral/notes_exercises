### IMPLEMENTATION
class ZombiesController < ApplicationController
  before_action :set_locale

  def index
    @zombies = Zombie.all
    respond_to do |format|
      format.json
    end
  end

  protected

  def set_locale
    I18n.locale = request.headers['Accept-Language']
  end
end

### SPEC

class ChangingLocalesTest < ActionDispatch::IntegrationTest
  test 'returns list of zombies in english' do
    get '/zombies', {}, {'Accept-Language' => 'en', 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    zombies = json(response.body)
    assert_equal "Watch out for #{zombies[0][:name]}!", zombies[0][:message]
  end

  test 'returns list of zombies in portuguese' do
    get '/zombies', {}, {'Accept-Language' => 'pt-BR', 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    zombies = json(response.body)
    assert_equal "Cuidado com #{zombies[0][:name]}!", zombies[0][:message]
  end
end
