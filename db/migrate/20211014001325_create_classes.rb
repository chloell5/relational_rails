class CreateClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :classes do |t|
      t.string :name
      t.string :day
      t.time :time
      t.integer :max_number
      t.boolean :drop_in
      t.references :gym, foreign_key: true
    end
  end
end
