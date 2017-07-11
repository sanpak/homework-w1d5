
# class InvalidStartingCup < StandardError
#   def initialize(msg="Invalid starting cup")
#   end
# end

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index { |cup,idx| @cups[idx] = [:stone,:stone,:stone,:stone] if idx != 13 && idx != 6 }
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 12 || start_pos < 0
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    distribute = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos
    until distribute.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13

      if cup_idx == 6
        @cups[6] << distribute.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << distribute.pop if current_player_name == @name2
      else
        @cups[cup_idx] << distribute.pop
      end
    end
    render
    next_turn(cup_idx)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?

    return true if (7..12).all? { |idx| @cups[idx] == [] } || (0..5).all? { |idx| @cups[idx] == [] }
    return false
  end

  def winner
  end
end
