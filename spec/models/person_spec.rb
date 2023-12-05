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
    context "when both first and last names are provided" do
      it "returns both names titlelized" do
        person = Person.new(first_name: "Bill", last_name: "smith")

        expect(person.full_name).to eq "Bill Smith"
      end
    end

    context "when only first name is present" do
      it "returns a titleized first name only" do
        person = Person.new(first_name: "jill")

        expect(person.full_name).to eq "Jill"
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
end
