require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Hamid', email: 'machipisajunior@mail.com', password: '123456') }
  let(:group) { Group.create(name: 'Transport', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaKTCERY75vBXcd1Hc4-fDXXoePpfkWPEjqQ&usqp=CAU', user_id: user.id) }

  describe 'Validations' do
    context 'when valid' do
      it { expect(group).to be_valid }
    end

    it 'should allow valid user_id' do
      group.user_id = nil
      expect(group).to_not be_valid
    end
  end
end
