class ChangeClassName < ActiveRecord::Migration[5.2]
  def change
    rename_table :classes, :activities
  end
end
