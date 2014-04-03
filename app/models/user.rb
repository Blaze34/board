# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  fio                    :string(255)
#  role                   :string(20)
#  mobile_phone           :string(255)
#  home_phone             :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

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

  scope :workers, -> { where role: :worker }

  acts_as_voter

  def role?(name)
    self.role.try(:to_sym) == name
  end
end
