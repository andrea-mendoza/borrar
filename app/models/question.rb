class Question < ApplicationRecord
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  
  accepts_nested_attributes_for :options, allow_destroy: true
  validates_associated :options

  validates_presence_of :type, :title

  def self.default_type
    'Questions::SelectOption'
  end

  def display_type
    type ? type.constantize.display_type : 'Type not set'
  end

  def is_quantitative?
    max_score
  end
end
