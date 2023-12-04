class Person < ApplicationRecord
  belongs_to :role
  has_many :posts, dependent: :destroy
  has_many :surveys, dependent: :destroy
  has_many :answers
  has_many :questions, through: :answers

  validates :first_name, presence: true
  validates :email, uniqueness: true

  after_initialize :set_token

  def self.billable
    joins(:role).merge(Role.billable)
  end

  def confirmed?
    confirmed_at.present?
  end

  def full_name
    [first_name, last_name].compact.join(" ").titleize
  end

  private

  def set_token
    self.token = SecureRandom.hex(10).encode("UTF-8")
  end
end
