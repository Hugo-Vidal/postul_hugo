class AddBetToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :bet, :string
  end
end
