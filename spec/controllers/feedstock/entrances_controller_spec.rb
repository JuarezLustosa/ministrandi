require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Feedstock::EntrancesController do

  # This should return the minimal set of attributes required to create a valid
  # Feedstock::Entrance. As you add validations to Feedstock::Entrance, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "supplier" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Feedstock::EntrancesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all feedstock_entrances as @feedstock_entrances" do
      entrance = Feedstock::Entrance.create! valid_attributes
      get :index, {}, valid_session
      assigns(:feedstock_entrances).should eq([entrance])
    end
  end

  describe "GET show" do
    it "assigns the requested feedstock_entrance as @feedstock_entrance" do
      entrance = Feedstock::Entrance.create! valid_attributes
      get :show, {:id => entrance.to_param}, valid_session
      assigns(:feedstock_entrance).should eq(entrance)
    end
  end

  describe "GET new" do
    it "assigns a new feedstock_entrance as @feedstock_entrance" do
      get :new, {}, valid_session
      assigns(:feedstock_entrance).should be_a_new(Feedstock::Entrance)
    end
  end

  describe "GET edit" do
    it "assigns the requested feedstock_entrance as @feedstock_entrance" do
      entrance = Feedstock::Entrance.create! valid_attributes
      get :edit, {:id => entrance.to_param}, valid_session
      assigns(:feedstock_entrance).should eq(entrance)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Feedstock::Entrance" do
        expect {
          post :create, {:feedstock_entrance => valid_attributes}, valid_session
        }.to change(Feedstock::Entrance, :count).by(1)
      end

      it "assigns a newly created feedstock_entrance as @feedstock_entrance" do
        post :create, {:feedstock_entrance => valid_attributes}, valid_session
        assigns(:feedstock_entrance).should be_a(Feedstock::Entrance)
        assigns(:feedstock_entrance).should be_persisted
      end

      it "redirects to the created feedstock_entrance" do
        post :create, {:feedstock_entrance => valid_attributes}, valid_session
        response.should redirect_to(Feedstock::Entrance.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved feedstock_entrance as @feedstock_entrance" do
        # Trigger the behavior that occurs when invalid params are submitted
        Feedstock::Entrance.any_instance.stub(:save).and_return(false)
        post :create, {:feedstock_entrance => { "supplier" => "invalid value" }}, valid_session
        assigns(:feedstock_entrance).should be_a_new(Feedstock::Entrance)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Feedstock::Entrance.any_instance.stub(:save).and_return(false)
        post :create, {:feedstock_entrance => { "supplier" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested feedstock_entrance" do
        entrance = Feedstock::Entrance.create! valid_attributes
        # Assuming there are no other feedstock_entrances in the database, this
        # specifies that the Feedstock::Entrance created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Feedstock::Entrance.any_instance.should_receive(:update).with({ "supplier" => "" })
        put :update, {:id => entrance.to_param, :feedstock_entrance => { "supplier" => "" }}, valid_session
      end

      it "assigns the requested feedstock_entrance as @feedstock_entrance" do
        entrance = Feedstock::Entrance.create! valid_attributes
        put :update, {:id => entrance.to_param, :feedstock_entrance => valid_attributes}, valid_session
        assigns(:feedstock_entrance).should eq(entrance)
      end

      it "redirects to the feedstock_entrance" do
        entrance = Feedstock::Entrance.create! valid_attributes
        put :update, {:id => entrance.to_param, :feedstock_entrance => valid_attributes}, valid_session
        response.should redirect_to(entrance)
      end
    end

    describe "with invalid params" do
      it "assigns the feedstock_entrance as @feedstock_entrance" do
        entrance = Feedstock::Entrance.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Feedstock::Entrance.any_instance.stub(:save).and_return(false)
        put :update, {:id => entrance.to_param, :feedstock_entrance => { "supplier" => "invalid value" }}, valid_session
        assigns(:feedstock_entrance).should eq(entrance)
      end

      it "re-renders the 'edit' template" do
        entrance = Feedstock::Entrance.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Feedstock::Entrance.any_instance.stub(:save).and_return(false)
        put :update, {:id => entrance.to_param, :feedstock_entrance => { "supplier" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested feedstock_entrance" do
      entrance = Feedstock::Entrance.create! valid_attributes
      expect {
        delete :destroy, {:id => entrance.to_param}, valid_session
      }.to change(Feedstock::Entrance, :count).by(-1)
    end

    it "redirects to the feedstock_entrances list" do
      entrance = Feedstock::Entrance.create! valid_attributes
      delete :destroy, {:id => entrance.to_param}, valid_session
      response.should redirect_to(feedstock_entrances_url)
    end
  end

end