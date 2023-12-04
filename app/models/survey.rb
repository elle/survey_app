class Survey < ApplicationRecord
  belongs_to :company
  belongs_to :person
  has_many :questions

  validates :slug, uniqueness: {case_sensitive: false, scope: :company_id}

  before_save :generate_slug

  def self.active
    where(active: true)
  end

  private

  def generate_slug
    self.slug = (slug.presence || name).parameterize
  end
end
