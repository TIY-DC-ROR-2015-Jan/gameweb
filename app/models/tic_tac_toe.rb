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
    p == players[current_player]
  end
end
