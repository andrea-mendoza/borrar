require 'rails_helper'

describe Survey do
    fixtures :surveys

    before(:example) do
        @survey =  surveys(:one)
    end

    it 'always has a name' do
        @survey.name = nil
        expect(@survey.valid?).to be_falsy
    end

    it 'has at least one question' do
        @survey.questions = []
        expect(@survey.valid?).to be_falsy
    end

    it 'it is valid when the maximum scores of its questions sum 100' do
        expect(@survey.maximum_score).to be == 100
        expect(@survey.valid?).to be_truthy
    end

    it 'it is invalid the maximum scores of its questions do not sum 100' do
        @survey.quantitative_questions.each {|question| question.max_score = 1}
        @survey.save
        expect(@survey.valid?).to be_falsy
    end
end