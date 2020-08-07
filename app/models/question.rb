class Question < ApplicationRecord
	has_many :choices, dependent: :destroy
	has_many :likes
	accepts_nested_attributes_for :choices #question作成時にchoiceも同時生成
	belongs_to :customer, optional: true
	belongs_to :genre
end
