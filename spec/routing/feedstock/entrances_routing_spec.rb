require "spec_helper"

describe Feedstock::EntrancesController do
  describe "routing" do

    it "routes to #index" do
      get("/feedstock/entrances").should route_to("feedstock/entrances#index")
    end

    it "routes to #new" do
      get("/feedstock/entrances/new").should route_to("feedstock/entrances#new")
    end

    it "routes to #show" do
      get("/feedstock/entrances/1").should route_to("feedstock/entrances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/feedstock/entrances/1/edit").should route_to("feedstock/entrances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/feedstock/entrances").should route_to("feedstock/entrances#create")
    end

    it "routes to #update" do
      put("/feedstock/entrances/1").should route_to("feedstock/entrances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/feedstock/entrances/1").should route_to("feedstock/entrances#destroy", :id => "1")
    end

  end
end
