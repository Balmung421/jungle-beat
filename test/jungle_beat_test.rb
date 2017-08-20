require "minitest/autorun"
require "minitest/pride"
require "./lib/linked_list"
require "./lib/node"
require "./lib/jungle_beat"
require "pry"

class JungleBeatTest < Minitest::Test

  attr_reader :beat

  def setup
    @beat = JungleBeat.new
  end

  def test_if_class_exists
    refute_nil beat
  end

  def test_for_new_linked_list
    assert_instance_of LinkedList, beat.list
    assert_nil nil, beat.list.head
  end

  def test_append
    assert_equal "deep doo ditt", beat.append("deep doo ditt")
    assert_equal "deep", beat.list.head.data
    assert_equal "doo", beat.list.head.next_node.data
    assert_equal "woo hoo shu", beat.append("woo hoo shu")
  end

  def test_count
    beat.append("deep doo ditt")
    beat.append("woo hoo shu")
    assert_equal 6, beat.count
  end

  def test_play
    assert_equal "deep doo ditt woo hoo shu", beat.append("deep doo ditt woo hoo shu")
    assert_equal 6, beat.count
    beat.play
  end

  def test_rate
    beat.set_rate(100)
    assert_equal (100), beat.set_rate(100)
    assert_equal (100), beat.rate
    beat.append("deep doo ditt")
    beat.append("woo hoo shu")
    beat.play
  end

  def test_voice_change
    beat.voice = "Alice"
    assert_equal "Alice", beat.voice
    beat.set_rate(50)
    assert_equal (50), beat.set_rate(50)
    beat.append("deep doo ditt")
    beat.append("woo hoo shu")
    beat.play
  end

  def test_voice_reset
    beat.voice = "Alice"
    beat.set_rate(50)
    beat.append("woo hoo shu")
    beat.play
    beat.reset_voice
    assert_equal "Boing", beat.voice
    beat.append("woo hoo shu")
    beat.play
  end

  def test_reset_rate
    beat.reset_rate
    assert_equal 20, beat.rate
  end

  def test_zach_horror
    beat.voice = "Alice"
    assert_equal "Alice", beat.voice
    beat.set_rate(100)
    #beat.append("remember, a believing heart is your magic")
    assert_equal "remember, a believing heart is your magic", beat.append("remember, a believing heart is your magic")
    beat.play
  end

end
