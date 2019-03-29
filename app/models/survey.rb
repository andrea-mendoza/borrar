class Survey < ApplicationRecord
    has_many :questions, dependent: :destroy
    has_many :reviews
    belongs_to :event
    
    accepts_nested_attributes_for :questions, allow_destroy: true

    validates_presence_of :name
    validates_associated :questions
    validate :at_least_one_question
    validate :maximum_score_is_hundred

    def quantitative_questions
        questions.select { |question| question.is_quantitative? }
    end
    
    def maximum_score
        quantitative_questions.map{ |question| question.max_score }.sum
    end

    def safe_to_remove?
        reviews.count == 0
    end

    private 

    def at_least_one_question
        errors.add(:questions, "should be at least 1") if questions.size < 1
    end

    def maximum_score_is_hundred
        errors.add(:questions, "maximum scores should sum 100") if maximum_score != 100
    end
end
