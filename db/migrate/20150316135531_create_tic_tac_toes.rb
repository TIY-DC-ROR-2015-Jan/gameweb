class CreateTicTacToes < ActiveRecord::Migration
  def change
    create_table :tic_tac_toes do |t|
      t.text :squares
      t.text :players
      t.integer :current_player

      t.timestamps null: false
    end
  end
end
