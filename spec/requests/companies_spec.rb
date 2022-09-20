require 'rails_helper'

RSpec.describe "CompaniesController", type: :request do
  describe "GET /companies" do
    it "renders successfully" do
      get companies_path
      expect(response).to have_http_status(200)
    end
  end
end
