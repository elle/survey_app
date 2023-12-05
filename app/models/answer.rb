class Answer < ApplicationRecord
  belongs_to :person, dependent: :destroy, required: true
  belongs_to :question, dependent: :destroy, required: true

  validates :body, presence: true
end
