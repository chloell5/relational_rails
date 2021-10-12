class CreateCompositions < ActiveRecord::Migration[5.2]
  def change
    create_table :compositions do |t|
      t.string :name
      t.string :artist
      t.boolean :on_display
      t.integer :year_made
      t.references :museum, foreign_key: true

      t.timestamps
    end
  end
end
