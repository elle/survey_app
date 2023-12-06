require "rails_helper"

RSpec.describe Post do
  include ActiveSupport::Testing::TimeHelpers

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  context "associations"

  describe ".by_person" do
    it "returns returns posts by a person" do
      person = create(:person, first_name: "expected")
      other_person = create(:person, first_name: "other")

      expected_post_1 = create(:post, person: person, title: "expected-one")
      expected_post_2 = create(:post, person: person, title: "expected-two")
      _other = create(:post, person: other_person, title: "other")

      result = Post.by_person(person)

      expect(result).to match_array([expected_post_1, expected_post_2])
    end
  end

  describe ".published" do
    it "only returns posts that with published on set to dates up to today" do
      _draft_1 = create(:post, published_on: nil)
      _draft_2 = create(:post, published_on: 1.day.from_now)
      published_post = create(:post, published_on: Date.today)

      expect(described_class.published).to eq [published_post]
    end
  end

  describe ".today" do
    context "when published is set" do
      it "returns posts from today only" do
        today = Date.current

        travel_to(today) do
          _yesterday_post = create(:post, published_on: today - 1.day)
          _draft_post = create(:post, published_on: nil)
          _future_post = create(:post, published_on: today + 1.day)
          start_of_day_post = create(:post, published_on: today.beginning_of_day)
          end_of_day_post = create(:post, published_on: today.end_of_day)

          result = described_class.today

          expect(result).to match_array [start_of_day_post, end_of_day_post]
        end
      end
    end
  end

  # dashboard
  # today's posts
  # visible to them
  describe ".visible" do
    context "when a user is the post's author" do
      context "and post is published" do
        it "returns the published post" do
          person = create(:person)
          post = create(:post, person: person, published_on: 1.day.ago)

          result = described_class.visible(person)

          expect(result).to eq [post]
        end
      end

      context "and post is draft" do
        it "returns the draft post" do
          person = create(:person)
          post = create(:post, person: person, published_on: nil)

          result = described_class.visible(person)

          expect(result).to eq [post]
        end
      end
    end

    context "when user is not the author" do
      context "and post is published" do
        it "returns the published post" do
          person = create(:person)
          post = create(:post, published_on: 1.day.ago)

          result = described_class.visible(person)

          expect(result).to eq [post]
        end

      end

      context "and post is draft" do
        it "does not return the draft post" do
          person = create(:person)
          _published = create(:post, published_on: 1.day.ago)
          draft = create(:post, published_on: nil)

          result = described_class.visible(person)

          expect(result).not_to include(draft)
        end

      end
    end
  end
end
