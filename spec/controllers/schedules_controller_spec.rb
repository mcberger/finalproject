require 'rails_helper'

RSpec.describe SchedulesController, :type => :controller do

let(:valid_session) { {user_id: 1} }

  describe "DELETE destroy" do
    it "destroys the requested schedule" do
      schedule = create(:schedule)
      delete :destroy, {id: 1}, valid_session
      expect(Schedule.all).to eq([])
    end

    it "redirects to the schedules list" do
      schedule = create(:schedule)
      delete :destroy, {id: 1}, valid_session
      expect(response).to redirect_to schedules_path
    end
  end


end
