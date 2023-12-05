class Survey < ApplicationRecord
  belongs_to :company
  belongs_to :person
  has_many :questions

  def self.active
    where(active: true)
  end
end
