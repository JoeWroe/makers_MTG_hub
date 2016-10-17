require 'rails_helper'

feature 'participating in events' do
  let(:user) { create(:user) }
  let!(:event) { create(:event, user_id: user.id) }

  before { sign_up }

  scenario 'user is prompted with a link to participate' do
    # allow(ApplicationController).to receive(:current_user).and_return(user)
    visit '/events'
    click_link(event.name)
    click_link("participate")
  end
end
