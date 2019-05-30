class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :type
      t.integer :hunger
      t.integer :hygiene
      t.integer :active
      t.integer :energy
      t.integer :happy

      t.timestamps
    end
  end
end
