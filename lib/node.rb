class Node
  attr_reader :data
  attr_accessor :next_node

  def initialize(data)
    @data = data
    @next_node = nil
  end

  # def data
  #   @data
  # end
  #let's use attr reader instead

  # def next_node
  #we can use attr_accessor and put #next_node = nil in initialize instead of defining the method down here
  # end


end
