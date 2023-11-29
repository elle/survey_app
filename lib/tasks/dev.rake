if Rails.env.development?
  require "factory_bot"

  namespace :dev do
    desc "Reset database and load sample data"
    task prime: ["db:reset", "dev:seed"]

    desc "Load sample data"
    task seed: :environment do
      include FactoryBot::Syntax::Methods
      include ActionView::Helpers::TextHelper

      Company.find_or_create_by(name: "Culture Amp")

      users.each do |user_attrs|
        Person.where(user_attrs).first_or_create
      end

      nat = Person.find_by(email: "nat@example.com")

      post = Post.create(
        person: nat,
        title: "TDD with RSpec workshop",
        body: "Lorem ipsum dolor",
        published_on: 1.day.ago,
      )
    end

    def users
      @users ||= [
        {
          first_name: "Clint",
          last_name: "Barton",
          email: "clint@example.com",
        },
        {
          first_name: "Laura",
          last_name: "Barton",
          email: "laura@example.com",
        },
        {
          first_name: "Natasha",
          last_name: "Romanoff",
          email: "nat@example.com",
        },
        {
          first_name: "Bruce",
          last_name: "Banner",
          email: "banner@example.com",
        },
        {
          first_name: "Steve",
          last_name: "Rogers",
          email: "steve@example.com",
        },
      ]
    end
  end
end
