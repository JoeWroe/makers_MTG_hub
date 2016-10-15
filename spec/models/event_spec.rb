require 'rails_helper'

RSpec.describe Event, type: :model do
  context "properties" do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:type) }
    it { is_expected.to respond_to(:cost) }
    it { is_expected.to respond_to(:min_size) }
    it { is_expected.to respond_to(:max_size) }
    it { is_expected.to respond_to(:start_time) }
  end
end
