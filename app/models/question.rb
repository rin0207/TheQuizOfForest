class Question < ApplicationRecord
	has_many :choices, dependent: :destroy
	accepts_nested_attributes_for :choices #question作成時にchoiceも同時生成
	belongs_to :customer
	belongs_to :genre
end
