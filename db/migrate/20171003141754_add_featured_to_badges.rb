class AddFeaturedToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :featured, :boolean, default: false 
  end
end
