
# class InvalidStartingCup < StandardError
#   def initialize(msg="Invalid starting cup")
#   end
# end

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index { |cup,idx| @cups[idx] = [:stone,:stone,:stone,:stone] unless idx == 6 || idx == 13 }
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13
    raise "Invalid starting cup" if start_pos <= 0
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    if current_player_name = name1
      until stones.empty?
        @cups[start_pos] = stones.pop if start_pos != 13
        start += 1
      end
    elsif current_player_name = name2
      until stones.empty?
        @cups[start_pos] 
      end

    end

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?


  end

  def winner

  end
end
