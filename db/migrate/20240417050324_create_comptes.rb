class CreateComptes < ActiveRecord::Migration[7.1]
  def change
    create_table :comptes do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
