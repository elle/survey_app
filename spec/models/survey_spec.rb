require "rails_helper"

RSpec.describe Survey do
  context "associations" do
    it { is_expected.to belong_to(:company) }
  end

  context "validations" do
    subject { build(:survey) }

    it do
      is_expected.to validate_uniqueness_of(:slug)
        .case_insensitive
        .scoped_to(:company_id)
    end
  end

  it "is active by default" do
    expect(described_class.new).to be_active
  end

  describe ".active" do
    it "return active surveys only" do
      company = create(:company)
      person = create(:person)
      active_survey_1 = create(
        :survey,
        name: "Active 1",
        company: company,
        person: person,
        active: true,
      )
      active_survey_2 = create(
        :survey,
        name: "Active 2",
        company: company,
        person: person,
        active: true,
      )
      _inactive_survey = create(
        :survey,
        name: "Inactive",
        company: company,
        person: person,
        active: false,
      )

      result = described_class.active

      expect(result).to match_array([active_survey_1, active_survey_2])
    end
  end

  describe "#generate_slug" do
    context "when provided manually" do
      it "parameterise user's unput" do
        survey = create(
          :survey,
          name: "My Callback",
          slug: "Callbacks are good sometimes",
        )

        expect(survey.slug).to eq "callbacks-are-good-sometimes"
      end
    end

    context "when not provided" do
      it "parameterises survey's name" do
        survey = create(:survey, name: "My Callbacks")

        expect(survey.slug).to eq "my-callbacks"
      end
    end
  end
end
