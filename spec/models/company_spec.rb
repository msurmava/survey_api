require 'rails_helper'

RSpec.describe Company, type: :model do
   let(:company) {FactoryBot.create(:company)}

  context 'name' do
   it { expect(company.name).to be_kind_of(String)}

   it { expect(company).to be_valid}
   
   it { expect(FactoryBot.build(:company, name: '')).not_to be_valid}
  end
end
