class CreateDoses < ActiveRecord::Migration[5.0]
  def change
    create_table :doses do |t|
      t.string :description
      t.string :cocktail
      t.string :ingredient

      t.timestamps
    end
  end
end
