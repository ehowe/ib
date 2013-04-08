require "spec_helper"

describe TranslatesController do
  describe "routing" do

    it "routes to #index" do
      get("/translates").should route_to("translates#index")
    end

    it "routes to #new" do
      get("/translates/new").should route_to("translates#new")
    end

    it "routes to #show" do
      get("/translates/1").should route_to("translates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/translates/1/edit").should route_to("translates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/translates").should route_to("translates#create")
    end

    it "routes to #update" do
      put("/translates/1").should route_to("translates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/translates/1").should route_to("translates#destroy", :id => "1")
    end

  end
end
