require_relative "../../app/models/a_good_sprint"

RSpec.describe AGoodSprint do
  context "without a survey" do
    it "is impossible" do
      alice = double(surveys: [])

      expect do
        AGoodSprint.for(alice)
      end.to raise_error CantCompleteSprintWithoutSurvey
    end
  end

  context "with a survey" do
    it "makes person happy" do
      alice = double(surveys: [double])
      allow(alice).to receive(:update_attributes).with(happiness: 20)

      AGoodSprint.for(alice)

      expect(alice).to have_received(:update_attributes).with(happiness: 20)
    end
  end
end
