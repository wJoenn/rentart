class CreateArts < ActiveRecord::Migration[7.0]
  def change
    create_table :arts do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.integer :size
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
