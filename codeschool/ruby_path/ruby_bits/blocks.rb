def call_this_block
  yield
end

call_this_block { puts 'Tweet' }

### --- ###

def call_this_block
  yield 'Tweet'
end

call_this_block { |myarg| puts myarg.upcase }

### --- ###

class Timeline
  def each
    @user.friends.each do |friend|
      friend.tweets.each { |tweet| yield tweet }
    end
  end

  include Enumerable
end

timeline = Timeline.new(user)
timeline.each { |tweet| puts tweet }

### --- ###

def while_signed_in_as(user)
  sign_in(user)
  yield
  rescue ConnectionError => e
    logger.error(e)
  ensure
    sign_out(user)
end

while_signed_in_as(user) do
  post(tweet)
end

while_signed_in_as(user) do
  retrieve_list(list_name)
end
