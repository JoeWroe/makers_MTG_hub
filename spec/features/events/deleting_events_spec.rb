require 'rails_helper'

feature 'deleting events' do
  let!(:event) { create(:event) }
  before do
    visit '/events'
    click_link event.name
  end
  context 'event deleted' do
    scenario 'should display a prompt to delete an event' do
      expect(page).to have_link 'delete'
    end

    scenario 'event is deleted' do
      expect { click_link 'delete' }.to change(Event, :count).by(-1)
      expect(current_path).to eq '/events'
      expect(page).to have_content('Event successully deleted')
    end
  end
end
