require "rails_helper"

RSpec.describe Person do
  context "validations" do
    # add validations first_name. email, admin
  end

  context "associations" do
    it { is_expected.to belong_to(:role) }
    # has_many posts, dependent
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
    # when present -> returns true
    # when nil -> returns false
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
