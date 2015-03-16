class TicTacToesController < ApplicationController
  def new
  end

  def create
    game = TicTacToe.start_game current_user.id, params[:opponent_id]
    # TODO: what if opponent_id is invalid
    redirect_to game
  end

  def show
    @game = TicTacToe.lookup_game params[:id]
    @can_play = @game.winner.nil? && @game.player_turn?(current_user.id)
    # TODO: view logic about taking moves if it's your turn
  end

  def update
    game = TicTacToe.lookup_game params[:id]
    if game.player_turn? current_user.id
      game.record_move params[:move].to_i
    else
      flash[:danger] = "It's not your turn!"
    end
    redirect_to game
  end
end
