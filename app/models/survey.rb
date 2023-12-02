class Survey < ApplicationRecord
  belongs_to :company

  def self.active
    where(active: true)
  end
end
