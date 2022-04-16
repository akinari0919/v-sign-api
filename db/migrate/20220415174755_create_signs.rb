class CreateSigns < ActiveRecord::Migration[7.0]
  def change
    create_table :signs do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.integer :type, null: false
      t.integer :angle, null: false
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
