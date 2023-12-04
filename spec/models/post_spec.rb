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
end
