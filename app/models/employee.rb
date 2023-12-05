class Employee < ApplicationRecord
  belongs_to :company, dependent: :destroy, required: true
  belongs_to :person, dependent: :destroy, required: true
end
