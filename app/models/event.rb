class Event < ApplicationRecord
    has_many :papers
    has_one :survey

    validates_presence_of :name
end
