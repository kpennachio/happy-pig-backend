class AddForeignKeyUsersToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_reference :animals, :user, index: true
    add_foreign_key :animals, :users
  end
end
