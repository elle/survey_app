class Person < ApplicationRecord
  belongs_to :role
  has_many :posts
  has_many :surveys

  after_initialize :set_token

  private

  def set_token
    self.token = SecureRandom.hex(10).encode("UTF-8")
  end
end
