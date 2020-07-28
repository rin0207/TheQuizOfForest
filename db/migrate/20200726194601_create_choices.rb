class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.text :sentence
      t.boolean :is_answer, default: false
      t.integer :question_id
      t.text :image_id

      t.timestamps
    end
  end
end
