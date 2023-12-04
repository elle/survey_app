require "rails_helper"

RSpec.describe Person do
  context "validations" do
    subject { build(:person) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  context "associations" do
    it { is_expected.to belong_to(:role) }
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    # it { is_expected.to have_many(:comments).dependent(:destroy) }
    # also add two more.. one for the company_members, and one for company
  end

  describe "#full_name" do
    context "when both first and last, returns both" do
      it "returns a titleized full name" do
        person = Person.new(first_name: "Homer", last_name: "simpson")

        expect(person.full_name).to eq "Homer Simpson"
      end
    end

    context "when only first name is present" do
      it "returns first_name" do
        person = Person.new(first_name: "homer")

        expect(person.full_name).to eq "Homer"
      end
    end
  end

  describe "#confirmed?" do
    context "when confirmed_at is present" do
      it "returns true" do
        person = described_class.new(confirmed_at: Time.current)

        expect(person).to be_confirmed
      end
    end

    context "when confirmed_at is nil" do
      it "return false" do
        expect(described_class.new).not_to be_confirmed
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

  describe ".surveys" do
    it "has many surveys" do
      alice = create(:person)
      survey = create(:survey)
      alice.surveys << survey

      expect(alice.reload.surveys).to include survey
    end
  end
end
