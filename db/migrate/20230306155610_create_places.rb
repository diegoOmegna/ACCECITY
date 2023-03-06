class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.text :details
      t.text :address
      t.string :zip_code
      t.references :user, null: false, foreign_key: true
      t.string :contact_email

      t.timestamps
    end
  end
end
