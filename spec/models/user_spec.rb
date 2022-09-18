require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  
  context 'user basic requirements' do

    it { expect(user.email).to be_kind_of(String) }
 
    it { expect(user.password_digest).to be_kind_of(String) }
  end 

  context 'email and password' do

    it { expect(user).to be_valid}

    it { expect(FactoryBot.build(:user, email: "aaaa")).not_to be_valid}
  
    it { expect(FactoryBot.build(:user, email: "")).not_to be_valid}

    it { expect(FactoryBot.build(:user, password_digest: "")).not_to be_valid}
  
  end

  context 'attributes' do
    it 'has email' do
      expect{user.email}.not_to raise_error(NoMethodError)
    end

    it 'has password' do
      expect{user.password_digest}.not_to raise_error(NoMethodError)
    end

    it 'need this example to check if tests really checks' do
      expect{user.emaail}.to raise_error(NoMethodError)
    end
  end
end 
