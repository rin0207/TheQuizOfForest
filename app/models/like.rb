class Like < ApplicationRecord
  belongs_to :question
  belongs_to :customer
end
