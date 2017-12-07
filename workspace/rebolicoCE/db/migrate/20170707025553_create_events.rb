class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :cep
      t.date :eventdate
      t.time :eventtime
      t.float :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
