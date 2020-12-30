require "rails_helper"
RSpec.describe PostcodesHelper do
  include PostcodesHelper

  describe "validate postcode using external api" do
    context "validates postcode" do
      it "returns false if empty postcode is passed" do
        expect(validate_postcode_external_api("")).to eq false
      end
      it "returns true if valid postcode is passed" do
        expect(validate_postcode_external_api("SE17QD")).to eq true
      end
      it "returns false if invalid postcode is passed" do
        expect(validate_postcode_external_api("SE17QDx")).to eq false
      end
    end
  end

  describe "validate postcode using internal allowed list" do
    context "validates postcode" do
      it "returns false if empty postcode is passed" do
        expect(validate_postcode_internal_list("")).to eq false
      end
      it "returns true if valid postcode is passed" do
        expect(validate_postcode_internal_list("GU345YU")).to eq true
      end
      it "returns false if invalid postcode is passed" do
        expect(validate_postcode_internal_list("SE17QDx")).to eq false
      end
    end
  end
end