class Role < ApplicationRecord
  has_many :people, dependent: :restrict_with_error

  validates :name, presence: true
end
