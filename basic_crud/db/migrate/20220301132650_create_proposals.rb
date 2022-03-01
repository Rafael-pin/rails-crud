class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :value, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps null: false
    end
  end
end
