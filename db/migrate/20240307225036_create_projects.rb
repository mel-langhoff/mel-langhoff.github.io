class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :repository_link
      t.string :local_link

      t.timestamps
    end
  end
end
