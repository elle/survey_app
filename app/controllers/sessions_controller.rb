class SessionsController < ApplicationController
  def new
  end

  def create
    person = Person.find_by(email: email)

    if person
      session[:person_id] = person.id
      redirect_to root_path, notice: t(".notice")
    else
      deny_access
    end
  end

  def destroy
    session[:person_id] = nil
    redirect_to root_path, notice: t(".notice")
  end

  private

  def email
    @email ||= params.dig(:session, :email)
  end
end
