class Grandparent
  def my_method
    "Grandparent: my_method called"
  end
end

class Parent < Grandparent
end

class Child < Parent
  def my_method
    string = super
    "#{string}\nChild: my_method called"
  end
end

child = Child.new
puts child.my_method
