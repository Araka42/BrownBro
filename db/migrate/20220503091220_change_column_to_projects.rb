class ChangeColumnToProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :category
    add_reference :projects, :category
    add_reference :projects, :jointure
  end
end
