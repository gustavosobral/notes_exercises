# controllers/items_controller.rb
class ItemsController < ApplicationController
  include ActionController::Live

  def show
    response.headers['Content-Type'] = 'text/event-stream'
    3.times {
      response.stream.write 'Hello, browser!\n'
      sleep 1
    }
    response.stream.close
  end
end

# assets/javascripts/owners.js
$(document).ready(initialize);

function initialize() {
  var source = new EventSource('/items/events');
  source.addEventListener('message', update);
};

function update(event) {
  var item = $('<li>').text(event.data);
  $('#items').append(item);
}
