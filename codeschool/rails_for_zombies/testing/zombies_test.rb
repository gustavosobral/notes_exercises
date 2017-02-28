require 'test_helper'

class ZombiesTest < ActionDispatch::IntegrationTest
  test 'Anyone can view zombie information' do
    zombie = zombies(:ash)
    get zombie_url(zombie)

    assert_response :success
    assert_select 'h1', zombie.name
  end

  test 'Anyone can view zombie information (Capybara)' do
    zombie = zombies(:ash)
    visit zombie_url(zombie)

    assert_equal zombie_path(zombie), current_path
    within('h1') do
      assert has_content?(zombie.name)
    end
  end

  test 'Navigation is available to the zombie page' do
    zombie = zombies(:ash)
    tweet = tweets(:hello)
    visit root_url

    within("#tweet_#{tweet.id}") do
      click_link zombie.name
      assert_equal zombie_path(zombie), current_path
    end
  end

  test 'Should create a new zombie' do
    visit root_url
    click_link 'Sign Up'
    fill_in 'Name', with: 'Breins'
    fill_in 'Graveyard', with: 'BREEEEIIINNNSSS'
    click_button 'Sign Up'
    assert_equal zombie_tweets_path('Breins'), current_path
  end
end
