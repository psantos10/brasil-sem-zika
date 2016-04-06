require 'rails_helper'

describe 'Sign up' do
  let(:user) { build :user }
  subject { page }

  before(:each) { visit new_user_registration_path }

  context 'when the form is filled with invalid data' do
    it 'doesnt allow to sign up' do
      fill_in 'user[email]', with: 'invalid_email'
      fill_in 'user[password]', with: 'invalid', match: :prefer_exact
      fill_in 'user[password_confirmation]', with: 'unmatched_password'
      fill_in 'user[first_name]', with: ''
      fill_in 'user[last_name]', with: ''

      click_button I18n.t('devise.registrations.new.sign_up')

      expect(subject).to have_content I18n.t('simple_form.error_notification.default_message')
    end
  end

  context 'when the form is filled with valid data' do
    it 'allows to sign up' do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password, match: :prefer_exact
      fill_in 'user[password_confirmation]', with: user.password
      fill_in 'user[first_name]', with: user.first_name
      fill_in 'user[last_name]', with: user.last_name
      fill_in 'user[address]', with: user.address
      fill_in 'user[cpf]', with: user.cpf

      click_button I18n.t('devise.registrations.new.sign_up')

      expect(subject).to have_content I18n.t('devise.registrations.signed_up')
    end
  end

  context 'when user enter a facebook account' do
    it "allows sign up through facebook" do
      mock_hash

      click_link I18n.t('devise.shared.links.sign_in_with_provider', provider: 'Facebook')
      expect(subject).to have_content I18n.t('devise.omniauth_callbacks.success', kind: 'Facebook')
    end
  end
end
