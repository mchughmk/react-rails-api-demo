class State < ApplicationRecord
  belongs_to :country

  validates_presence_of :code, :name, :country
end
