require "rails_helper"

RSpec.describe Survey do
  context "associations" do
    it { is_expected.to belong_to(:company) }
  end

  it "is active by default" do
    expect(described_class.new).to be_active
  end

  describe ".active" do
    it "return active surveys only" do
      company = create(:company)
      active_survey_1 = company.surveys.create(name: "Active 1", active: true)
      active_survey_2 = company.surveys.create(name: "Active 2", active: true)
      _inactive_survey = described_class.create(name: "Inactive", active: false)

      result = described_class.active

      expect(result).to match_array([active_survey_1, active_survey_2])
    end
  end
end
