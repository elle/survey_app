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

  def self.published
    where(published_on: ..Time.current)
  end

  def self.today
    start_of_day = Date.current.beginning_of_day
    end_of_day = Date.current.end_of_day
    where(published_on: start_of_day..end_of_day)
  end

  def self.visible(user)
    where(person: user).or(published)
  end
end
