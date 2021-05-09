class AddAgeToBakers < ActiveRecord::Migration[5.1]
  def change
    add_column :bakers, :age, :string
  end
end
