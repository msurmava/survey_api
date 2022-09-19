require 'rails_helper'

RSpec.describe "ResearchesController", type: :request do
  describe "GET /researches" do
    it "works! (now write some real specs)" do
      get researches_path
      expect(response).to have_http_status(200)
    end
  end
end
