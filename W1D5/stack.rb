class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    raise "Stack is empty" if @stack.is_empty?
    @stack.pop
  end

  def show
    @stack.dup
  end
end
stack = Stack.new
stack.add("John")
stack.add("Peter")
stack.add("May")


class Node
  def initialize(value,next_node)
    @value = value
    @next_node = next_node
  end
end
