require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Api::V1::UsersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      email: 'leanhdaovn@gmail.com',
      first_name: 'Dao',
      last_name: 'Le'
    }
  }

  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }

  before(:each) do
    create_list(:user, 10)
  end

  describe 'GET #index' do
    it 'assigns all users as @users' do
      get :index
      expect(response).to be_success
      expect(json_body.length).to eq(10)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user as @user' do
      user = User.first
      get :show, params: {id: user.id}
      expect(json_body['email']).to eq(user.email)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect {
          post :create, params: {user: valid_attributes}
        }.to change(User, :count).by(1)
        user = User.last
        expect(user.email).to eq(valid_attributes[:email])
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          first_name: 'Minh',
          last_name: 'Ton'
        }
      }

      it 'updates the requested user' do
        user = User.first
        put :update, params: {id: user.id, user: new_attributes}
        user.reload
        expect(user.first_name).to eq(new_attributes[:first_name])
        expect(user.last_name).to eq(new_attributes[:last_name])
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.first
      expect {
        delete :destroy, params: {id: user.id}
      }.to change(User, :count).by(-1)
    end
  end

end