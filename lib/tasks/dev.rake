if Rails.env.development?
  require "factory_bot"

  namespace :dev do
    desc "Reset database and load sample data"
    task prime: ["db:reset", "dev:seed"]

    desc "Load sample data"
    task seed: :environment do
      include FactoryBot::Syntax::Methods
      include ActionView::Helpers::TextHelper
      company = Company.find_or_create_by(name: "Culture Amp")

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

      survey = Survey.find_or_create_by(
        name: "Engagement survey",
        company: company,
        person: nat,
      )
    end
  end

  def designer
    @designer ||= Role.where(name: "Designer").first
  end

  def engineer
    @engineer ||= Role.where(name: "Engineer").first
  end

  def manager
    @product_manager ||= Role.where(name: "Manager").first
  end

  def users
    @users ||= [
      {
        first_name: "Clint",
        last_name: "Barton",
        email: "clint@example.com",
        role: designer,
      },
      {
        first_name: "Laura",
        last_name: "Barton",
        email: "laura@example.com",
        role: engineer,
      },
      {
        first_name: "Natasha",
        last_name: "Romanoff",
        email: "nat@example.com",
        role: manager,
      },
      {
        first_name: "Bruce",
        last_name: "Banner",
        email: "banner@example.com",
        role: engineer,
      },
      {
        first_name: "Steve",
        last_name: "Rogers",
        email: "steve@example.com",
        role: manager,
      },
    ]
  end
end
