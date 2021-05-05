class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :ingredients, :type, :kind
  end
end
