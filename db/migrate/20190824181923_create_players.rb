class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :money, default: 10000

      t.timestamps
    end
  end
end
