require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Hamid', email: 'machipisajunior@mail.com', password: '123456')
  end
  before { subject.save }

  it 'should have name not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should validate the name' do
    subject.name = 'Hamid'
    expect(subject).to be_valid
  end
end
