require 'rails_helper'

describe HomeController do
  
  describe 'GET home with user' do
    it "blocks unauthenticated access" do
      sign_in nil
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it "allows authenticated access" do
      sign_in FactoryGirl.create(:user)
      get :index
      expect(response).to be_success
    end
  end
end
