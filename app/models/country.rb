class Country < ApplicationRecord
    has_many :states

    validates_presence_of :code, :name
end
