class DropTableAddress < ActiveRecord::Migration
  def change
    drop_table :addresses, force: :cascade do |t|
      t.string :cep
      t.string :street_name
      t.string :extra_info
      t.references :addressable, polymorphic: true, index: true
    end
  end
end
