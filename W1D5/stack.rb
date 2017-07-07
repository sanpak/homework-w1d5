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

queue = Queue.new
queue.enqueue("John")
queue.enqueue("Peter")
queue.enqueue("Sam")
queue.show

class Map
  def initialize
    @map = []
  end

  def assign(key,value)
    pair_index = @map.index {|pair| pair[0] == key}
    pair_index ? @map[pair_index][1] = value : @map.push([key, value])
    [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
  end

  def remove(key)
    @map.each do |el|
      @map.delete(el) if el[0] == "a"
    end
    nil
  end

end
map = Map.new
map.assign("a",1)
