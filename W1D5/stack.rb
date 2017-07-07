class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    raise "Stack is empty" if @stack.length == 0
    @stack.pop
  end

  def show
    @stack
  end
end
stack = Stack.new
stack.add("John")
stack.add("Peter")
stack.add("May")

class Queue
  def initialize
    @stack = []
  end

  def enqueue(el)
    @stack << el
    el
  end

  def dequeue
    @stack.shift
  end

  def show
    @stack
  end
end


class Node
  def initialize(value,next_node)
    @value = value
    @next_node = next_node
  end
end
