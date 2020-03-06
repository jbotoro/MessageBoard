require 'rails_helper'
require 'support/controller_macros.rb'

RSpec.describe PostsController, type: :controller do 
    # let(:user) {FactoryBot.build(:user)}

    describe 'log in and click create new post' do
        login_user

        it 'should render new post page' do
            get :new
            expect(response).to have_http_status(:success)
        end
    end
    describe 'click create new post without log in' do

        it 'should redirect to index' do
            get :new
            expect(response).to have_http_status(:redirect)
        end
    end

    # scenario 'forget to add email and submit form' do
    #     visit new_user_registration_path
    #     partial_fill_in
    #     expect(page).to have_content("Email can't be blank")
    # end
end