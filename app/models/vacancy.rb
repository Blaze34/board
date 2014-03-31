# == Schema Information
#
# Table name: vacancies
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  salary            :integer
#  employment        :string(255)
#  expire            :integer
#  expire_at         :datetime
#  user_id           :integer
#  cached_skill_list :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Vacancy < ActiveRecord::Base
  extend Enumerize

  validates :name, :expire_at, :employment, :skill_list, presence: true
  validate :expire_cannot_be_in_the_past, unless: 'expire_at.blank?'

  enumerize :employment, in: [:full, :part, :remote]

  acts_as_taggable_on :skills
  belongs_to :user

  scope :open, -> { where 'expire_at > ?', Date.today }

  def expire_cannot_be_in_the_past
    errors.add(:expire_at, 'can\'t be in the past') if expire_at.to_date < Date.today
  end
end
