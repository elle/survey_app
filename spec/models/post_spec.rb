require "rails_helper"

RSpec.describe Post do
  include ActiveSupport::Testing::TimeHelpers

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  context "associations" do
    it {is_expected.to belong_to(:person).required }
  end

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
    context "when published_on is not set" do
      it "does not return unpublished posts" do
        create(:post)

        expect(Post.published).to be_empty
      end
    end

    context "when published_on is set" do
      context "when timestamp is greater than current time" do
        it "considers past posts as published" do
          now = Time.current

          travel_to(now) do
            _draft_post = create(:post, published_on: nil)
            _future_post = create(:post, title: "future", published_on: now + 1.minute)
            past_post = create(:post, title: "past", published_on: now - 1.minute)

            result = Post.published

            expect(result).to eq [past_post]
          end
        end
      end
    end
  end

  describe ".today" do
    context "when published is set" do
      it "returns posts from today only" do
        today = Date.current

        travel_to(today) do
          _draft_post = create(:post, published_on: nil)
          _future_post = create(:post, title: "future", published_on: today + 1.day)
          _past_post = create(:post, title: "past", published_on: today - 1.day)
          start_of_today_post = create(:post, title: "morning", published_on: today.beginning_of_day)
          end_of_today_post = create(:post, title: "night", published_on: today.end_of_day)

          result = Post.today

          expect(result).to eq [start_of_today_post, end_of_today_post]
        end
      end
    end
  end

  # A post if visible when
  # it belongs to a user
  # or it is published
  describe ".visible" do
    context "when user is the post's author" do
      context "and post is published" do
        it "returns the published post" do
          post = create(:post, published_on: 2.days.ago)
          user = post.person

          result = Post.visible(user)

          expect(result).to eq([post])
        end
      end

      context "and post is draft" do
        it "returns the user's draft posts" do
          author = create(:person)
          draft_post_1 = create(:post, person: author, published_on: nil)
          draft_post_2 = create(:post, person: author, published_on: 1.day.from_now)

          result = Post.visible(author)

          expect(result).to match_array [draft_post_1, draft_post_2]
        end
      end
    end

    # current_user in session is different to post.person (author)
    context "when user is not the post's author" do
      context "and post is published" do
        it "returns the published post" do
          post = create(:post, published_on: 2.days.ago)
          user = create(:person)

          result = Post.visible(user)

          expect(result).to eq [post]
        end
      end

      context "and post is draft" do
        it "returns no posts" do
          post = create(:post, published_on: nil)
          user = create(:person)

          result = Post.visible(user)

          expect(result).to be_empty
        end
      end
    end
  end
end
