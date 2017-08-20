require "./lib/node"
require "minitest/autorun"
require "minitest/pride"
require "pry"

class NodeTest < Minitest::Test

  attr_reader :node

  def setup
    @node = Node.new("plop")
  end
  def test_a_node_can_be_created
    assert_equal Node, node.class
    assert_equal "plop", node.data
  end

  def test_if_node_can_hold_different_data
    @node = Node.new("All Might")
    assert_equal "All Might", node.data
  end

  def test_if_next_node_is_nill_by_default
    @node = Node.new("Akko Kagari")
    assert_equal "Akko Kagari", node.data
    assert_nil nil, node.next_node
  end
end
