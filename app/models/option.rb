class Option < ApplicationRecord
    belongs_to :question

    validates_presence_of :point, :description

    def show
        "(#{point}) #{description}"
    end

    def value
        point
    end
end
