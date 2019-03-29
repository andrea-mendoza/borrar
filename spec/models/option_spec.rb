require 'rails_helper'

describe Option do
    fixtures :options

    before do
        @option = options(:one)
    end

    it 'always has a value' do
        @option.point = nil
        expect(@option.valid?).to be_falsy
    end

    it 'always has a description' do
        @option.description = nil
        expect(@option.valid?).to be_falsy
    end
end