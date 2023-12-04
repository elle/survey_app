class Answer < ApplicationRecord
  belongs_to :person
  belongs_to :question
end
