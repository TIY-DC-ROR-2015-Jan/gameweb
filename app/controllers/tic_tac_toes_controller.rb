class TicTacToesController < ApplicationController
  def new
    # Pick opponent
  end

  def create
  end

  def show
    @game = TicTacToe.lookup_game params[:id]
    # TODO: view logic about taking moves if it's your turn
  end

  def update
    game = TicTacToe.lookup_game params[:id]
    if game.player_turn? current_user
      game.record_move params[:move]
    else
      flash[:danger] = "It's not your turn!"
    end
    redirect_to game
  end
end
