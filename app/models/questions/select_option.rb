module Questions
class SelectOption < Question
    validates_presence_of :max_score
    validate :number_of_options
    
    def self.display_type
        'Escala'
    end

    def is_quantitative?
        true
    end
    
    private
    
    def number_of_options
        errors.add(:options, "should be at least 2") if options.size < 2
    end
end
end
