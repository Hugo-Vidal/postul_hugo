class AddWagerToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :wager, :integer
  end
end
