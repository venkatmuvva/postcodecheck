require "rails_helper"

RSpec.describe PostcodesController, :type => :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  describe "GET validate" do
    context "validates postcode" do
      it "using external API" do
        get :validate, :xhr => true, :params => {:postcode => "SE17QD"}
        expect(response.status).to eq 200
      end
      it "using internal list" do
        get :validate, :xhr => true, :params => {:postcode => "GU345YU"}
        expect(response.status).to eq 200
      end
      it "throws error for invalid code" do
        get :validate, :xhr => true, :params => {:postcode => "xyz"}
        expect(response.status).to eq 404
      end
      it "throws error for non xhr request" do
        get :validate, :xhr => false
        expect(response.status).to eq 400
      end
    end
  end
end