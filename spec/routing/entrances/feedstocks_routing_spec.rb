require "spec_helper"

describe Entrances::FeedstocksController do
  describe "routing" do

    it "routes to #index" do
      get("/entrances/feedstocks").should route_to("entrances/feedstocks#index")
    end

    it "routes to #new" do
      get("/entrances/feedstocks/new").should route_to("entrances/feedstocks#new")
    end

    it "routes to #show" do
      get("/entrances/feedstocks/1").should route_to("entrances/feedstocks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/entrances/feedstocks/1/edit").should route_to("entrances/feedstocks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/entrances/feedstocks").should route_to("entrances/feedstocks#create")
    end

    it "routes to #update" do
      put("/entrances/feedstocks/1").should route_to("entrances/feedstocks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/entrances/feedstocks/1").should route_to("entrances/feedstocks#destroy", :id => "1")
    end

  end
end
