require 'rails_helper'

RSpec.describe "OptionsController", type: :request do
  let(:research){create(:research)}
  let(:inquiry){create(:inquiry, research_id: research.id)}
  let(:question){create(:question, inquiry_id: inquiry.id)}

  describe "GET /opntios" do
    context 'index' do
      context 'status' do
        it 'has 200 status' do
        
          get research_inquiry_question_options_path(research_id: research.id, inquiry_id: inquiry.id, question_id: question.id)

          expect(response).to have_http_status(200) 
        end
      end

      context 'response' do
        let(:options){question.options}

        it 'renders options' do        
          get research_inquiry_question_options_path(research_id: research.id, inquiry_id: inquiry.id, question_id: question.id)

          expect(response.body).to eq({'options' => options}.to_json) 
        end
      end
    end
  end
end
