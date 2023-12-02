require "rails_helper"

RSpec.describe Role do
  context "associations" do
    it { is_expected.to have_many(:people).dependent(:restrict_with_error) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe ".billable?" do
    it "default to false" do
      expect(described_class.new).not_to be_billable
    end
  end
end
