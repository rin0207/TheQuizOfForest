class CreateQuestionTags < ActiveRecord::Migration[5.2]
  def change
  	remove_column :tags, :question_id, :integer
    create_table :question_tags do |t|
      t.integer :tag_id
      t.integer :question_id

      t.timestamps
    end
  end
end
