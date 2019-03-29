require 'rails_helper'

describe Question do
    fixtures :questions

    before(:example) do
        @select_option = questions(:select_option_one)
    end

    it 'always has a type' do
        @select_option.type = nil
        expect(@select_option.valid?).to be_falsy
    end

    it 'always have a title' do
        @select_option.title = nil
        expect(@select_option.valid?).to be_falsy
    end

    context :Text do
        it 'always has a description' do
            @text = questions(:text_one)
            @text.description = nil
            expect(@text.valid?).to be_falsy
        end
    end

    context :SelectOption do
        it 'always has a max score' do
            @select_option.max_score = nil
            expect(@select_option.valid?).to be_falsy
        end
        
        it 'is invalid with less than two options' do
            invalid_select_option = questions(:invalid_select_option)
            expect(invalid_select_option.options.count).to be == 0
            expect(invalid_select_option.valid?).to be_falsy
        end
        
        # it 'has at least two options' do
        #     expect(@select_option.options.count).to be == 3
        #     expect(@select_option.valid?).to be_truthy
        # end

        it 'validates number of options before create' do
            survey = Survey.new(name: 'letitle')
            survey.questions.build( { type:'Questions::SelectOption', title: 'Introduction', max_score: 30,
                options_attributes: [ { point: 1, description: 'Good'},
                                      { point: 2, description: 'Bad'} ] } )
            expect(survey.questions.first).to be_truthy
        end
    end
end