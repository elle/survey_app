class Person < ApplicationRecord
  belongs_to :role
  has_many :posts
  has_many :surveys

  after_initialize :set_token

  def full_name
    [first_name, last_name].compact.join(" ").titleize
  end

  private

  def set_token
    self.token = SecureRandom.hex(10).encode("UTF-8")
  end
end
