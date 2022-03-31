class CreateJointures < ActiveRecord::Migration[6.1]
  def change
    create_table :jointures do |t|
      t.references :category, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
