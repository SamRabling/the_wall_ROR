require 'rails_helper'

RSpec.describe TheWallController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #messages" do
    it "returns http success" do
      get :messages
      expect(response).to have_http_status(:success)
    end
  end

end
