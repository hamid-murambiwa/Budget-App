require 'rails_helper'

RSpec.describe Proceeding, type: :model do
  let(:user) { User.create(name: 'Hamid', email: 'machipisajunior@mail.com', password: '123456') }
  let(:group) { Group.create(name: 'Transport', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaKTCERY75vBXcd1Hc4-fDXXoePpfkWPEjqQ&usqp=CAU', user_id: user.id) }
  let(:proceeding) { Proceeding.create(name: 'BMW', amount: 5, user_id: user.id, group_id: group.id) }

  describe 'Validations' do
    it 'should validate proceeding' do
      expect(proceeding).to be_valid
    end
    it 'should validate amount ' do
      proceeding.amount = -6
      expect(proceeding).to_not be_valid
    end
    it 'should validate amount ' do
      proceeding.amount = 5
      expect(proceeding).to be_valid
    end
  end
end
