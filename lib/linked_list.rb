require 'pry'

class LinkedList
  attr_reader   :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = Node.new(data)
    end
  end

  def count
    if @head == nil
      return 0
    end
    counter = @head
    count = 0
    while counter != nil
      counter = counter.next_node
      count += 1
    end
  count
  end

  def to_string
    if @head == nil
      return ""
    end
    string_node = @head
    node_objects = [@head.data]
    while string_node.next_node != nil
      string_node = string_node.next_node
      node_objects << string_node.data
    end
   node_objects.join(" ")

  end

def prepend(data)
  @head = Node.new(data, next_node=@head)
end

  def insert(index, data)
    current = @head
    (index-1).times do
      if current.next_node != nil
        current = current.next_node
      end
    end
  new_node = Node.new(data)
    if current.next_node != nil
      new_node.next_node = current.next_node
    end
  current.next_node = new_node
end

  def find(index, amount)
    mover = self.count - index - amount
    x = @head
    mover.times {x = x.next_node}
    finder_data = []
    amount.times do
    finder_data << x.data
    x = x.next_node
    end
  finder_data_to_s = finder_data.join(" ")
  finder_data_to_s
end

  def includes?(data)
    mover = @head
    loop do
      if mover == nil
        return false
      elsif mover.data == data
        return true
      else
        mover = mover.next_node
      end
    end
  end

  def pop
    x = @head
    previous = nil
    loop do previous = x
      x = x.next_node
      break if  x.next_node == nil
    end
    previous.next_node = nil  
    end
  end
