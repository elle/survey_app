require "rails_helper"

RSpec.describe Person do
  context "associations" do
    it { is_expected.to belong_to(:role) }
    # has_many posts, dependent
  end

  context "validations" do
    # add validations first_name. email, admin
  end

  describe "#full_name" do
    context "when both first and last names are provided" do
      it "returns both names titlelized" do
        person = described_class.new(first_name: "Bill", last_name: "smith")

        expect(person.full_name).to eq "Bill Smith"
      end
    end

    context "when only first name is present" do
      it "returns a titleized first name only" do
        person = described_class.new(first_name: "jill", last_name: nil)

        expect(person.full_name).to eq "Jill"
      end
    end
  end

  describe "#confirmed?" do
    context "when confirmed_at is set" do
      it "return true" do
        person = described_class.new(confirmed_at: Time.now)

        expect(person.confirmed?).to be_truthy
      end
    end

    context "when confirmed_at is not set" do
      it "returns false" do
        person = described_class.new(confirmed_at: nil)

        expect(person.confirmed?).to be_falsy
      end
    end
  end

  describe "#set_token" do
    context "on initialize" do
      it "sets a random token" do
        expect(Person.new.token).to be_present
      end
    end
  end
end
