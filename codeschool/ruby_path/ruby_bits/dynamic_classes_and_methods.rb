# Struct

Tweet = Struct.new(:user, :status) do
  def to_s
    "#{user}: #{status}"
  end  
end

tweet = Tweet.new('Gregg', 'compiling!')
tweet.to_s

# Alias method

class Tweet
  def tweets
    @tweets
  end

  alias_method :contents, :tweets
end

# Define method

class Tweet
  define_method :draft do
    @status = :draft
  end
end

# Get method instance

class Tweet
  def find(argument)
    ...
  end
end

t = Tweet.new
find = t.method(:find),
find.call('Foo')
