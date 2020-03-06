require 'rails_helper'

feature "signing up" do
    let(:user) {FactoryBot.build(:user)}

    def fill_in_form 
        fill_in 'Password', with: user.password, match: :first
        fill_in 'Password confirmation', with: user.password_confirmation
        fill_in 'Email', with: user.email
        click_button "Sign up"
    end

    def partial_fill_in
        fill_in 'Password', with: user.password, match: :first
        fill_in 'Password confirmation', with: user.password_confirmation
        click_button "Sign up"
    end

    scenario 'successfully fill out and submit sign up form' do
        visit new_user_registration_path
        fill_in_form
        expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'forget to add email and submit form' do
        visit new_user_registration_path
        partial_fill_in
        expect(page).to have_content("Email can't be blank")
    end
end