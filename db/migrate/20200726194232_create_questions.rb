class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.text :image_id
      t.integer :is_allowed, default: 0, null: false
      t.text :comment
      t.integer :customer_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
