require 'rails_helper'
require_relative '../support/devise'

RSpec.describe SecretController, type: :controller do
  describe "GET /index" do
    it "redirect if not signed in" do
      get :index
      expect(response).to redirect_to '/home'
    end
 
  end
  describe "logged in" do
    before :each do 
      @user = FactoryBot.create(:user)
      sign_in @user
    end
    it "show if signed in" do
      get :index
      expect(response).to render_template(:index) 
    end 
  end
end
