module QuestionsHelper
    def fields_of_question(question_type)
        type = question_type
        type.slice!('Questions::')
        'questions/' + type.underscore + '_fields'
    end

    def question_types_info
        Question.subclasses.map { |question_type|
            [question_type.display_type, question_type] 
        }
    end
end