require "rails_helper"

RSpec.describe SessionsController do
  describe "#create" do
    context "when user authentication failed" do
      it "denies access" do
        post :create, params: { session: { email: "" } }

        expect(response).to redirect_to(login_path)
        expect(flash[:alert]).to eq t("flash.unauthorised")
      end
    end
  end
end
