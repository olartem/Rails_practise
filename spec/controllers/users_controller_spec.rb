require 'rails_helper'
require_relative '../support/devise'

RSpec.describe UsersController, type: :controller do
  describe "not logged in" do
  end

  describe "logged in" do
    before :each do 
      @user = FactoryBot.create(:user)
      sign_in @user
    end
  end
end
