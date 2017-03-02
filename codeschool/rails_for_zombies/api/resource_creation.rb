### IMPLEMENTATION
class EpisodesController < ApplicationController
  def create
    episode = Episode.new(episode_params)
    if episode.save
      head 204, location: episode
      render nothing: true, status: :no_content, location: episode
      render json: episode, status: :created, location: episode
    else
      render json: episode.errors, status: :unprocessable_entity
    end
  end

  private
    def episode_params
      params.require(:episode).permit(:title, :description)
    end
end

### SPEC
class CreatingEpisodesTest < ActionDispatch::IntegrationTest

  test 'creates episodes' do
    post '/episodes',
      { episode: { title: 'Bananas', description: 'Learn about bananas.' } },
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    episode = json(response.body)
    assert_equal episode_url(episode[:id]), response.location
  end
end
