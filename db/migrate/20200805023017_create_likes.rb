class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :question, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
