class User < ActiveRecord::Base
  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enumerize :role, in: [:employer, :worker]

  validates :fio, presence: true, format: { with: /\A[а-я]+\s[а-я]+\s[а-я]+\z/i,
      message: 'должен содержать ваше настоящие имя кириллицей'
  }

  validates :mobile_phone, presence: true, if: 'home_phone.blank?'
  validates :home_phone, presence: true, if: 'mobile_phone.blank?'

  has_one :user_fields
  accepts_nested_attributes_for :user_fields

  def role?(name)
    self.role.try(:to_sym) == name
  end
end
