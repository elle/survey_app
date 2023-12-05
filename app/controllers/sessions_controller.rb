class SessionsController < ApplicationController
  def create
    person = Person.find_by(email: email)

    if person
      session[:person_id] = person.id
      redirect_to root_path, notice: "Logged in!"
    else
      deny_access
    end
  end

  def destroy
    session[:person_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

  private

  def email
    @email ||= params.dig(:session, :email)
  end
end
