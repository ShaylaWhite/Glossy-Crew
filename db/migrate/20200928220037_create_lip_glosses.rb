class CreateLipGlosses < ActiveRecord::Migration[6.0]
  def change
    create_table :lip_glosses do |t|
      t.string :name
      t.integer :price
      t.belongs_to :sponsor, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
