require 'rails_helper'

describe Event do
    fixtures :events

    it 'always has a name' do
        event = events(:one)
        event.name = nil
        expect(event.valid?).to be_falsy
    end
end