module Questions
class Text < Question
    validates_presence_of :description

    def self.display_type
        'Texto'
    end

    def is_quantitative?
        false
    end
end
end
