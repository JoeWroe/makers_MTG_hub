require 'rails_helper'

feature 'creating events' do
  before do
    sign_up
  end
  
  context 'a valid event' do
    scenario 'User fills out form, event is created, new event displayed' do
      visit '/events'
      expect { make_an_event }.to change(Event, :count).by(1)
      expect(page).to have_content "Edward's Event"
      expect(page).to have_content "Event successfully created"
      expect(current_path).to eq "/events/#{Event.last.id}"
    end
  end
  context 'an invalid event' do
    it 'does not let you submit an event missing a field' do
      visit '/events'
      expect { make_event_with_missing_fields }.not_to change(Event, :count)
      expect(page).to have_content 'Event information not valid'
    end
  end
end
