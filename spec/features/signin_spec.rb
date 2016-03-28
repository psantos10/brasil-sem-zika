require 'rails_helper'

describe 'Sign in feature' do
  let(:user) { create :user }
  subject { page }

  before(:each) { visit new_user_session_path }

  context 'when the user is registered' do
    it 'allows to sign in' do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password

      click_button I18n.t('devise.sessions.new.sign_in')

      expect(subject).to have_content I18n.t('devise.sessions.signed_in')
    end
  end

  context 'when the user isnt registered' do
    it 'doesnt allow to sign in' do
      fill_in 'user[email]', with: 'unregistered@example.com'
      fill_in 'user[password]', with: 'password'

      click_button I18n.t('devise.sessions.new.sign_in')

      expect(subject).to have_content I18n.t('devise.failure.invalid', authentication_keys: 'email')
    end
  end
end
