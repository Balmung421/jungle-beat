require "./lib/node"
require "minitest/autorun"
require "minitest/pride"
require "pry"

class NodeTest < Minitest::Test
                #iteration 0
                def test_a_node_can_be_created
                  node = Node.new("plop")

                  assert_equal Node, node.class
                  assert_equal "plop", node.data
                  #binding.pry #Here, the node is holding "plop" Uncomment out binding.pry and runy it like usual, and call node in pry to see what it is!
                end

                def test_if_node_can_hold_different_data
                  node = Node.new("All Might")
                  assert_equal "All Might", node.data
                  #binding.pry #here the node is holding "All Might".
                end

                def test_if_next_node_is_nill_by_default
                  node = Node.new("Akko Kagari")
                  assert_nil nil, node.next_node #assert_equal depricated, use assert_nil if expecting nil
                  #refute node.next_node #same as assert_equal
                end
                #iteration 0 end










end
