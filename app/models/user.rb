class User < ApplicationRecord
  attr_writer :login
  after_initialize :set_default_role, :if => :new_record?
  
  has_many :papers
  has_many :comments
  has_many :reviews

  paginates_per 6
  
  enum role: [:estudiante, :docente, :director]


  def login
    @login || self.username || self.email
  end

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def set_default_role
    self.role ||= :estudiante
  end

  def complete_name
    "#{name} #{lastname}"
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  

end
