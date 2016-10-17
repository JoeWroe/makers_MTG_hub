class Event < ApplicationRecord
  belongs_to :user
  GAME_FORMATS = %i(sealed draft constructed).freeze
  REQUIRED = %i(name game_format description cost).freeze

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :cost
  validates_presence_of :start_time
  validates_presence_of :game_format
end
