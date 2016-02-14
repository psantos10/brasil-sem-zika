class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :address
      t.string :cep
      t.references :state, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
