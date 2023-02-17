class CreateArts < ActiveRecord::Migration[7.0]
  def change
    create_table :arts do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :location
      t.integer :height
      t.integer :width
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
