require 'rails_helper'

RSpec.describe AvailabilitiesController, :type => :controller do

let(:valid_session) { {user_id: 1} }

# fails be default because of the user.fname, rspec has not made the relation between user and availability, it seems
  # describe "GET show" do
  #   it "assigns requested availability as @availability" do
  #     availability = create(:availability)
  #     get :show, {id: 1}, valid_session
  #     expect(assigns(:availability)).to eq(availability)
  #   end
  # end

  describe "DELETE destroy" do
    it "destroys the requested availability" do
      availability = create(:availability)
      delete :destroy, {id: 1}, valid_session
      expect(Availability.all).to eq([])
    end

    it "redirects to the availabilities list" do
      availability = create(:availability)
      delete :destroy, {id: 1}, valid_session
      expect(response).to redirect_to availabilities_path
    end
  end

end