require 'rails_helper'

RSpec.describe EventsController, :type => :controller do

let(:valid_session) { {user_id: 1} }

  # describe "GET index" do
  #   it "assigns all events as events" do
  #     event = create(:event)
  #     get :index, {}, valid_session
  #     expect(assigns(:events)).to eq([event])
  #   end
  # end

  describe "GET show" do
    it "assigns requested event as @event" do
      event = create(:event)
      get :show, {id: 1}, valid_session
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new, {}
      expect(assigns(:event)).to be_an_instance_of(Event)
    end
  end

  describe "POST create" do
    context " valid_attributes" do
      it "check that @event is assigned" do
        post :create, {event: attributes_for(:event)}, valid_session
        expect(assigns(:event)).to be_an_instance_of(Event)
      end

      it "check that @event is saved to db" do
        post :create, {event: attributes_for(:event)}, valid_session
        expect(Event.all.count).to eq(1)
      end

      it "check that page is redirected to @event" do
        post :create, {event: attributes_for(:event)}, valid_session
        expect(response).to redirect_to(assigns(:event))
      end

    end

    context " invalid_attributes" do
      it "check that @event is assigned" do
        post :create, {event: attributes_for(:invalid_event)}, valid_session
        expect(assigns(:event)).to be_an_instance_of(Event)
      end

      it "check that page is redirected to create a new event" do
        post :create, {event: attributes_for(:invalid_event)}, valid_session
        expect(response).to redirect_to new_event_path
      end
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      event = create(:event)
      get :edit, {id: 1}, valid_session
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "PATCH update" do
    context " valid_attributes" do
      it "check that @event is assigned" do
        event = create(:event)
        patch :update, {id: event.id, event: attributes_for(:updated_event)}, valid_session
        expect(assigns(:event)).to eq(event)
      end

      it "check that @event.update.name is saved to Event.all" do
        event = create(:event)
        patch :update, {id: event.id, event: attributes_for(:updated_event)}, valid_session
        event.reload
        expect(event.name).to eq("event 1")
      end

      it "check that @event.update.start_time is saved to Event.all" do
        event = create(:event)
        patch :update, {id: event.id, event: attributes_for(:updated_event)}, valid_session
        event.reload
        expect(event.start_time).to eq("2016-01-23 17:00:00000000000 +0100")
      end

      it "check that page is redirected to @event" do
        event = create(:event)
        patch :update, {id: event.id, event: attributes_for(:updated_event)}, valid_session
        event.reload
        expect(response).to redirect_to(assigns(:event))
      end
    end

    context " invalid_attributes" do
      it "check that @event is assigned" do
        event = create(:event)
        patch :update, {id: event.id, event: attributes_for(:invalid_event)}, valid_session
        event.reload
        expect(assigns(:event)).to be_an_instance_of(Event)
      end

      it "check that page is redirected to @event.edit" do
        event = create(:event)
        patch :update, {id: event.id, event: attributes_for(:invalid_event)}, valid_session
        event.reload
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      event = create(:event)
      delete :destroy, {id: 1}, valid_session
      expect(Event.all).to eq([])
    end

    it "redirects to the events list" do
      event = create(:event)
      delete :destroy, {id: 1}, valid_session
      expect(response).to redirect_to events_path
    end
  end


end
