require 'rails_helper'

RSpec.describe "InquiriesController", type: :request do
  let(:research){create(:research)}

  describe "GET /research_inquiries" do
    let(:inquiries){{"inquiries" => research.inquiries}}

    context 'status' do
      it "has http status 200" do
        get  research_inquiries_path(research_id: research.id)

        expect(response).to have_http_status(200)
      end
    end
    

    context 'response body' do     
      it "inquiries of one research" do
        get  research_inquiries_path(research_id: research.id)

        expect(JSON.parse(response.body)).to eq(inquiries)
      end
    end
  end
  
  describe "GET /research_inquiry" do
    let(:inquiry){create(:inquiry, research_id: research.id)}
    
    context "status" do
      it 'is successfull' do
        get research_inquiry_path(research_id: research.id, id: inquiry.id)

        expect(response).to have_http_status(200)
      end
    end

    context 'resopnse body' do
      it 'key is inquiry' do
        get research_inquiry_path(research_id: research.id, id: inquiry.id)

        expect(JSON.parse(response.body).keys.join).to eq('inquiry')
      end

      it 'renders json with inquiry' do
        get research_inquiry_path(research_id: research.id, id: inquiry.id)

        expect(response.body).to eq({'inquiry' => inquiry}.to_json)
      end 
    end
  end
end


