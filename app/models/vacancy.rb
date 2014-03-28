class Vacancy < ActiveRecord::Base
  extend Enumerize

  validates :name, :expire_at, :employment, :skill_list, presence: true
  validate :expire_cannot_be_in_the_past, unless: 'expire_at.blank?'

  enumerize :employment, in: [:full, :part, :remote]

  acts_as_taggable_on :skills
  belongs_to :user

  def expire_cannot_be_in_the_past
    errors.add(:expire_at, 'can\'t be in the past') if expire_at.to_date < Date.today
  end
end
