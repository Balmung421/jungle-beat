require "minitest/autorun"
require "minitest/pride"
require "./lib/linked_list"
require "./lib/node"
require "pry"

class LinkedListTest < Minitest::Test

  attr_reader :list

  def setup
    @list = LinkedList.new
  end

  def test_head
    assert_nil nil, list.head
    list.append("doop")
    assert_instance_of Node, list.head
    assert_nil list.head.next_node
  end

  def test_append
     list.append("doop")
     assert_equal "doop", list.to_string
  end

  def test_count
    assert_equal 0, list.count
    list.append("doop")
    assert_equal 1, list.count
  end

  def test_to_string
    list.append("doop")
    assert_equal "doop", list.to_string
    list.append("deep")
    assert_equal "doop deep", list.to_string
    assert_equal 2, list.count
  end

  def test_prepend
    list.append("plop")
    assert_equal "plop", list.to_string
    list.append("suu")
    assert_equal "plop suu", list.to_string
    list.prepend("dop")
    assert_equal "dop plop suu", list.to_string
  end

  def test_insert
    list.append("plop")
    assert_equal "plop", list.to_string
    list.append("suu")
    assert_equal "plop suu", list.to_string
    list.prepend("dop")
    assert_equal "dop plop suu", list.to_string
    list.insert(1, "woo")
    assert_equal "dop woo plop suu", list.to_string
    list.insert(2, "kuma")
    assert_equal "dop woo kuma plop suu", list.to_string
  end

  def test_find
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")
    list.find(2, 1)
    assert_equal "shi", list.find(2, 1)
    list.find(1, 3)
    assert_equal "woo shi shu", list.find(1, 3)
  end

  def test_includes?
    list.append("deep")
    list.append("All Might")
    list.append("Zach")
    list.append("Akko")
    assert_equal true, list.includes?("deep")
    assert_equal false, list.includes?("dep")
  end

  def test_pop
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")
    list.pop
    assert_equal "deep woo shi shu", list.to_string
    list.pop
    assert_equal "deep woo shi",  list.to_string
  end

end
