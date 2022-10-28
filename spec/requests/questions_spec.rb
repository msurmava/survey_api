require 'rails_helper'

RSpec.describe "QuestionsController", type: :request do
  let(:research){create(:research)}
  let(:inquiry){create(:inquiry, research_id: research.id)}

  describe "GET /research_inquiry_questions" do
    let(:questions){inquiry.questions}

    context 'status' do
      it 'successfull 200'do
        get research_inquiry_questions_path(research_id: research.id, inquiry_id: inquiry.id)

        expect(response).to have_http_status(200)
      end
    end

    context 'response' do
      it 'renders questions of an inquiry' do
        get research_inquiry_questions_path(research_id: research.id, inquiry_id: inquiry.id)

        expect(response.body).to eq({'questions' => questions}.to_json)
      end
    end
  end

  describe "GET /research_inquiry_question" do
    let(:question){create(:question, inquiry_id: inquiry.id)}

    context 'status' do
      it 'has 200 status' do
      
        get research_inquiry_question_path(research_id: research.id, inquiry_id: inquiry.id, id: question.id)

        expect(response).to have_http_status(200) 
      end
    end

    context 'response' do
      it 'renders single question json' do
      
        get research_inquiry_question_path(research_id: research.id, inquiry_id: inquiry.id, id: question.id)

        expect(response.body).to eq({'question' => question}.to_json) 
      end
    end
  end
end

