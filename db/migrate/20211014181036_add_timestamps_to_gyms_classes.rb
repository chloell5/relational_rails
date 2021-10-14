class AddTimestampsToGymsClasses < ActiveRecord::Migration[5.2]
  def change
    change_table :gyms do |t|
      t.timestamps
    end
    change_table :classes do |t|
      t.timestamps
    end
  end
end
