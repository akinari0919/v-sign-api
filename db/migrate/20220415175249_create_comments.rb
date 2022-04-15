class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :sign, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :body, null: false

      t.timestamps
    end
  end
end