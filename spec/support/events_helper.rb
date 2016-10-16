def make_an_event
  click_button 'Add an event'
  fill_in 'Name', with: "Edward's Event"
  find('#event_game_format').find(:xpath, 'option[2]').select_option
  fill_in 'Description', with: 'An Event that is inspiring'
  fill_in 'Cost', with: 12
  find('#event_start_time_1i').find(:xpath, 'option[2]').select_option
  find('#event_start_time_2i').find(:xpath, 'option[2]').select_option
  find('#event_start_time_3i').find(:xpath, 'option[2]').select_option
  find('#event_start_time_4i').find(:xpath, 'option[2]').select_option
  find('#event_start_time_5i').find(:xpath, 'option[2]').select_option
  click_button 'Create Event'
end

def make_event_with_missing_fields
  click_button 'Add an event'
  fill_in 'Name', with: "Edward's Event"
  click_button 'Create Event'
end
