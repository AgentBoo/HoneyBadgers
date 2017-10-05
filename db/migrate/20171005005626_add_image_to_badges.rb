class AddImageToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :image_id, :string
  end
end
