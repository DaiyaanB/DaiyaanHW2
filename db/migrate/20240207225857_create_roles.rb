class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.integer "movie"
      t.integer "actor"
      t.string "character_name"
      t.timestamps
    end
  end
end
