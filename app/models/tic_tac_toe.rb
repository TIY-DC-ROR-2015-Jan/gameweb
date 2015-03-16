class TicTacToe < ActiveRecord::Base
  serialize :players, JSON
  serialize :squares, JSON

  def self.start_game p1,p2
    g = TicTacToe.new
    g.squares = [nil,nil,nil,nil,nil,nil,nil,nil,nil]
    g.players = [p1,p2]
    g.current_player = 0
    g.save!
    g
  end

  def self.lookup_game id
    TicTacToe.find id
  end

  def player_turn? p
    p == players[current_player]
  end

  def current_symbol
    current_player.zero? ? :x : :o
  end

  def toggle_player
    if current_player.zero?
      update current_player: 1
    else
      update current_player: 0
    end
  end

  def record_move square
    place current_symbol, square
    toggle_player
    save!
  end

  # -- Ported from PORO ----

  def value_at location
    squares[location - 1]
  end

  def place sym, location
    if squares[location - 1].nil?
      squares[location - 1] = sym
    end
  end

  def full?
    squares.none? { |n| n.nil? }
  end

  def winner
    lines = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,5,9],
      [3,5,7],
      [1,4,7],
      [2,5,8],
      [3,6,9]
    ]
    lines.each do |line|
      winner = check_line_for_winner line
      return winner if [:x,:o].include?(winner)
    end
    return nil
  end

  def check_line_for_winner line
    # if line.all? { |square| value_at(square) == value_at(line.first) }
    #   unless value_at(line.first).nil?
    #     return value_at(line.first)
    #   end
    # end
    values = line.map { |location| value_at location }
    if values.uniq.count == 1
      return values.first
    end
  end
end
