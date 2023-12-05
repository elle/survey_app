class Question < ApplicationRecord
  belongs_to :survey, required: true
  belongs_to :answers, required: true

  validates :label, presence: true
end
