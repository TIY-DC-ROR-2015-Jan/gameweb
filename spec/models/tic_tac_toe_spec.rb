require 'rails_helper'

describe TicTacToe do
  fit "can lookup games from the database" do
    created = TicTacToe.start_game 1,2
    loaded  = TicTacToe.lookup_game created.id
    expect(created.id).to eq loaded.id
    expect(loaded.player_turn? 1).to eq true
  end

  it "can record a move" do
    g = TicTacToe.start_game 4,7
    g.record_move 3
    expect(g.board.value_at 3).to eq :x
  end

  it "knows whos turn it is" do
    g = TicTacToe.start_game 4,7
    g.record_move 3
    g.record_move 5
    g.record_move 1
    expect(g.player_turn? 7).to eq true
  end
end
