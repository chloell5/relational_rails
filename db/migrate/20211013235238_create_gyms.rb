class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :location
      t.boolean :open
      t.integer :rank
    end
  end
end
