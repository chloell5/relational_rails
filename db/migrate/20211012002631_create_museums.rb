class CreateMuseums < ActiveRecord::Migration[5.2]
  def change
    create_table :museums do |t|
      t.string :name
      t.boolean :free_admission
      t.integer :donation_revenue

      t.timestamps
    end
  end
end
