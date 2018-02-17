require "byebug"
class KPF

  attr_reader :visited_positions

  def initialize(start_position)
    @start_position = start_position
    @move_tree = self.build_move_tree
    @visited_positions = [start_position]
  end

  def build_move_tree
    nil
  end

  def find_path(pos)
    nil
  end

  def self.valid_moves(pos)
    #Checks if pos is already in visited_positions
    range = (0..7)
    #debugger

    if !range.include?(pos[0]) || !range.include?(pos[1])
      return false
    elsif visited_positions.include?(pos)
      return false
    end

    true
  end

  #return an array of possible moves we haven't already visited
  def new_move_positions(pos)
    moves_arr = []

    #Generate all possible moves from current pos
    moves_arr << [pos[0] + 2, pos[1] - 1]
    moves_arr << [pos[0] + 1, pos[1] + 2]
    moves_arr << [pos[0] + 2, pos[1] + 1]
    moves_arr << [pos[0] + 1, pos[1] - 2]
    moves_arr << [pos[0] - 2, pos[1] + 1]
    moves_arr << [pos[0] - 1, pos[1] + 2]
    moves_arr << [pos[0] - 2, pos[1] - 1]
    moves_arr << [pos[0] - 1, pos[1] + 2]

    #use valid moves to remove already visited pos

    moves_arr.map! do |move|
      range = (0..7)

      debugger

      if !range.include?(move[0]) || !range.include?(move[1])
        next
      elsif visited_positions.include?(move)
        next
      end

    end


    #push new moves into visited_positions
    @visited_positions += moves_arr
  end

end
