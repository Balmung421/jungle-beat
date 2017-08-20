require 'pry'

class LinkedList
  attr_reader   :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head == nil #if head is nill, we are at the "start"
      @head = Node.new(data) #if it is nil, we are calling our instance variable head is a new node from our node file. Wont be nill any longer after this conditional #calling the first item as the head allows us to prepend below!
    else
      current = @head #if the head is not nil, we will store it in a the vairable ccurrent
      while current.next_node != nil #current loop--while it is not nil (since here, the next instance of nil will be the end of the linked list)
        current = current.next_node #current vaiable is storing our new nodes in current.next_node (from our node file)
      end
      current.next_node = Node.new(data) #the last line of the method is always returned, so we are defining current.next_node as Node.new(data), aka we are creating a new node at the end of the list before the next_node == nil
    end
  end

  def count
    if @head == nil #head
      return 0 #because head == nil means we have an "empty" list
    end
    counter = @head #creating a counter variable
    count = 0 #setting a count variable to 0 so we can iterate through
    while counter != nil #while loop that says keep counting until you hit nil, which will not be the nil in the @head, but the nil at the end of the list
      counter = counter.next_node #saying counter should = the next node
      count += 1 #this makes us go through the loop, so back through to the next_node until we hit nil
    end
  count #returning count since that is the variable we want called when we call this method
  end

  def to_string
    if @head == nil #if the head is nil
      return "" #return "" since we have an empty link list
    end
    string_node = @head #store our vaiable string_node at the @head to start at the beginning (in the broadest sense) of the linkedlist
    node_objects = [@head.data] #creating a node_objects variable (since these are best called objects aka nodes with data) and storing it in @head.data array!
    while string_node.next_node != nil #loop, keep going until we hit nil at the end of the list
      string_node = string_node.next_node #assignign values
      node_objects << string_node.data #storing it into our array called above
    end
   node_objects.join(" ") #creating a variable to store values from our loop and joing them with " "
    #x #call x, since we are on the last line of the array
  end

def prepend(data)
  @head = Node.new(data, next_node=@head) #@head is called here, since in my testing example (lines 38-45), "plop" is our head, so by calling data before next_node, it prepends! "Head, is the top aka first item in our linked list"
end

  def insert(index, data)
    current = @head #creating a variable current and calling it to the @head
    (index-1).times do #taking the index argument, and subtracting 1 from it aka 1-1 is 0, so index 1 will put it first. .times is a ruby method that can be used with the do loop below.
      if current.next_node != nil #like all the other times, this allows us to hit the nil at the end of the linked list
        current = current.next_node #storing the value
      end
    end
  new_node = Node.new(data) #creating variable called new_node
    if current.next_node != nil #saying if the variable does not hit nil at end
      new_node.next_node = current.next_node #storing this loop, defining Node.new, into the current.next node value above
    end
  current.next_node = new_node #calling the "worked through values!"
end

  def find(index, amount)
    mover = self.count - index - amount #mover aka what will go through our linked list
    x = @head #creating variable x
    mover.times {x = x.next_node} #one line do end! going through each objecct with next_node
    finder_data = [] #creating an empty array that stores our mover movment
    amount.times do  #calling amount from our argument above
    finder_data << x.data #shoveling x variable from our loop into the finder_data array we made
    x = x.next_node #our x is the next_node to go through the loop
    end
  finder_data_to_s = finder_data.join(" ") #lets take the results of our do loops above and convert them to a string!
  finder_data_to_s
end

  def includes?(data)
    mover = @head #creating a "mover" like in find
    loop do #lets create another loop!
      if mover == nil #practicing writing these loops in different ways, this is similar to !=nil from my prior examples
        return false
      elsif mover.data == data #sandwhiched boolean statment from ?
        return true
      else
        mover = mover.next_node #move throuh the linked list
      end
    end
  end

  def pop
    x = @head #variable and assign it to @head, our test is a full appended list
    previous = nil #this is needed to say the reverse is nil, since pop is removing the end, not the beginning
    loop do previous = x #another loop! assigning @head to nil due to above assignments
      x = x.next_node #move through it
      break if  x.next_node == nil #break if we reach the nil at the END of the linked list
    end
    previous.next_node = nil  #assigning previous as our next_node to nil after the loop so we know we are at the end
    end
  end
