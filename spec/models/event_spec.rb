require 'rails_helper'

RSpec.describe Event, type: :model do

  PROPERTIES = %i(name description game_format cost min_size max_size start_time).freeze
  REQUIRED = %i(name description game_format cost start_time).freeze

  context "properties" do
    PROPERTIES.each do |property|
      it { is_expected.to respond_to(property) }
    end
  end

  context "validates presence of" do
    it "required attributes" do
      event = build(:event)
      REQUIRED.each do |property|
        event.assign_attributes(property => nil)
        expect(event).not_to be_valid
        expect(event).to have(1).error_on(property)
      end
    end
  end
end
