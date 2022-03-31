class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.string :video_url
      t.text :description

      t.timestamps
    end
  end
end
