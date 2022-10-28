require 'rails_helper'

RSpec.describe "ResearchesController", type: :request do
  describe "GET /researches" do
    let(:researches){Research.all}
    context 'index' do
      context 'status' do
        it 'has 200 status' do
        
          get researches_path
  
          expect(response).to have_http_status(200) 
        end
      end
  
      context 'response' do
  
        it 'renders researches' do        
          get researches_path
  
          expect(response.body).to eq({'researches' => researches}.to_json) 
        end
      end
    end
  end
end


