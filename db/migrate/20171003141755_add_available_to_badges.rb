class AddAvailableToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :available, :boolean, default: true
  end
end
