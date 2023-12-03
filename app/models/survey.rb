class Survey < ApplicationRecord
  belongs_to :company
  belongs_to :person

  def self.active
    where(active: true)
  end
end
