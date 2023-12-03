class AGoodSprint
  def self.for(person)
    if person.surveys.empty?
      raise CantCompleteSprintWithoutSurvey
    else
      person.update_attributes(happiness: 20)
    end
  end
end

class CantCompleteSprintWithoutSurvey < Exception; end
