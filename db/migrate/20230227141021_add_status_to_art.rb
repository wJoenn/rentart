class AddStatusToArt < ActiveRecord::Migration[7.0]
  def change
    add_column :arts, :status, :string
  end
end
