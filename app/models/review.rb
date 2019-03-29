class Review < ApplicationRecord
  belongs_to :paper
  belongs_to :user
  belongs_to :survey
  has_many :evaluations, dependent: :destroy
  accepts_nested_attributes_for :evaluations

  def build_evaluation(question)
    new_record? ? evaluations.build(question_id: question.id) : evaluations.find_by(question_id: question.id)
  end
  
  def quantitative_evaluations
    evaluations.select { |evaluation| evaluation.is_quantitative? }
  end

  def qualitative_evaluations
    evaluations.select { |evaluation| evaluation.is_qualitative? }
  end

  def final_score
    evaluations.sum(:score)
  end
end
