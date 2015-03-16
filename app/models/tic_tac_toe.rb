class TicTacToe < ActiveRecord::Base
  serialize :players, JSON

  def self.start_game p1,p2
    g = TicTacToe.new
    g.players = [p1,p2]
    g.current_player = 0
    g.save!
    g
  end

  def self.lookup_game id
    TicTacToe.find id
  end

  def player_turn? p
    if current_player == 0
      players.first == p
    else
      players.last == p
    end
  end
end
