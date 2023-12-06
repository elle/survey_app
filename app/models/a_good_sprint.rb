class AGoodSprint
  def self.for(user)
    if user.surveys.empty?
      raise CantCompleteSprintWithoutASurvey.new
    else
      user.update_attributes(happiness: 20)
    end
  end
end

class CantCompleteSprintWithoutASurvey < Exception
end
