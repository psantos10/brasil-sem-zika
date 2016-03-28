require 'rails_helper'

RSpec.feature 'Create a complaint', type: :feature do
  let(:state) { create(:state) }
  let!(:city) { create(:city) }
  let(:user) { create(:user) }

  before { login_as(user, scope: :user) }

  context 'when a user fills the form with valid data' do
    it 'allows the creation' do
      visit new_complaint_path
      fill_in 'complaint[cep]', with: '48370-000'
      fill_in 'complaint[address]', with: 'Rua da linha, 06'
      select 'Westeros', from: 'complaint[state_id]'
      select 'Winterfell', from: 'complaint[city_id]'

      click_button I18n.t('helpers.submit.complaint.create')

      expect(page).to have_content('Complaint was successfully created.')
    end
  end

  context 'when a user fills the form with incorrect data' do
    it 'dosent allow the creation' do
      visit new_complaint_path

      click_button I18n.t('helpers.submit.complaint.create')

      expect(page).to_not have_content('Complaint was successfully created.')
    end
  end
end
