require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:valid_session) { {user_id: 1} }

  # describe "GET 'index'" do
  #   it "assigns all users with same establishment as @users" do
  #     user = create(:user)
  #     your_establishment = user.establishment
  #     get :index, {}
  #     expect(assigns(:users)).to eq([user])
  #   end
  # end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user = create(:user)
      delete :destroy, {id: 1}, valid_session
      expect(User.all).to eq([])
    end

    it "redirects to the users list" do
      user = create(:user)
      delete :destroy, {id:1}, valid_session
      expect(response).to redirect_to users_path
    end
  end

end
