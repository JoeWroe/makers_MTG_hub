require 'rails_helper'

feature 'updating events' do
  let!(:event) { create(:event) }
  before do
    visit '/events'
    click_link event.name
  end
  context 'event updated' do
    scenario 'should display a prompt to edit an event' do
      expect(page).to have_link 'edit'
    end
    scenario 'user can update event, success message displayed' do
      click_link 'edit'
      fill_in 'Name', with: "Jamie's Event"
      click_button 'Update Event'
      expect(current_path).to eq "/events/#{event.id}"
      expect(page).to have_content("Jamie's Event")
      expect(page).to have_content('Event successully updated')
    end
  end
  context 'event not updated' do
    scenario 'invalid field, error message displayed' do
      click_link 'edit'
      fill_in 'Name', with: ""
      click_button 'Update Event'
      expect(current_path).to eq "/events/#{event.id}/edit"
      expect(page).to have_content('Event information not valid')
    end
  end
end
