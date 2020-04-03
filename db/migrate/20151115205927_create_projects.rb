class CreateProjects < ActiveRecord::Migration[4.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :link

      t.timestamps null: false
    end
  end
end
