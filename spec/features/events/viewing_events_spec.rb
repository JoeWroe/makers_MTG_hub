require 'rails_helper'

feature 'viewing events' do
  context 'no events have been added' do
    scenario 'should display a prompt to add an event' do
      visit '/events'
      expect(page).to have_button 'Add an event'
    end
  end

  context 'Events have been added' do
    let!(:event) { create(:event, name: "Ed's Event") }
    before { visit '/events' }

    scenario 'display events' do
      expect(page).to have_content(event.name)
    end
    scenario 'can click on event to see event details' do
      click_link("Ed's Event")
      expect(current_path).to eq "/events/#{event.id}"
      expect(page).to have_content(event.name)
      expect(page).to have_content(event.cost)
      expect(page).to have_content(event.description)
      expect(page).to have_content(event.game_format)
      expect(page).to have_content(event.start_time)
    end
  end
end
