class AddCategsToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :categs, :string, array: true, default: []
  end
end
