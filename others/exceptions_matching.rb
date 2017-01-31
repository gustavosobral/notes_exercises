def exceptions_mathching(&block)
  Class.new do
    def self.===(other)
      @block.call(other)
    end
  end.tap do |c|
    c.instance_variable_set(:@block, block)
  end
end

begin
  raise "FOOBAR: We're all doomed!"
rescue exceptions_mathching { |e| e.message =~ /^FOOBAR/ }
  puts 'Rescued!'
end
