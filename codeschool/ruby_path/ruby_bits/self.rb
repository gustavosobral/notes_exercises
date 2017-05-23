# class_eval

class Tweet
  attr_accessor :status
end

Tweet.class_eval do
  attr_accessor :user
end

# method logger

class MethodLogger
  def log_method(klass, method_name)
    klass.class_eval do
      alias_method "#{method_name}_original", method_name

      define_method method_name do |*args, &block|
        puts "#{Time.now}: Called #{method_name}"
        send "#{method_name}_original", *args, &block
      end
    end
  end
end
