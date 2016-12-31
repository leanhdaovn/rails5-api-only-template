require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'validation' do
    context 'no password' do
      it 'cannot create' do
        expect{User.create(email: Faker::Internet.email)}.not_to change(User, :count)
      end
    end

    context 'duplicated email address' do
      it 'cannot create' do
        user = create(:user)
        expect{User.create(email: user.email, password: 'mypassword')}.not_to change(User, :count)
      end
    end
  end
end
