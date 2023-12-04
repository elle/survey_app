class Post < ApplicationRecord
  belongs_to :person, required: true

  validates :title, presence: true

  enum status: {
    draft: 0,
    finished: 1,
    reviewed: 2,
    accepted: 3,
    published: 4,
    promoted: 5,
    rejected: 6,
    archived: 7,
  }

  def self.by_person(person)
    joins(:person).where(person: person)
  end

  def self.most_recent
    order(created_at: :desc)
  end
end
