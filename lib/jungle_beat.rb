require "pry"

class JungleBeat
attr_reader :list
attr_accessor :rate, :voice

  def initialize
      @list = LinkedList.new
      reset_rate
      reset_voice
  end

  def append(data)
      objects = data.split(" ")
      objects.each {|x| @list.append(x)}
    data
    end

    def count
      @list.count
    end

  def set_rate(rate)
      @rate = rate
  end

  def reset_rate
    @rate = 20
  end

  def reset_voice
    @voice = "Boing"
  end

  def play
    beat = @list.to_string
    system ("say -r #{rate} -v #{voice} #{beat}")
  end

end
