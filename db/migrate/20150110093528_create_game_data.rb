class CreateGameData < ActiveRecord::Migration
  def change
    create_table :game_data do |t|
      t.text :dict
      t.text :state

      t.timestamps
    end
  end
end
