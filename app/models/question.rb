class Question < ApplicationRecord
	has_many :choices, dependent: :destroy
	has_many :likes
	has_many :question_tags
	accepts_nested_attributes_for :choices #question作成時にchoiceも同時生成
	belongs_to :customer, optional: true
	belongs_to :genre
	attachment :image

	enum is_allowed:{
		許可待ち: 0,
		不許可: 1,
		許可: 2,
	}, _suffix: true
end
