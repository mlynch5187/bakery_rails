class AddJobToBakers < ActiveRecord::Migration[5.1]
  def change
    add_column :bakers, :job, :string
  end
end
