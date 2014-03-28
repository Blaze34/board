class Vacancy < ActiveRecord::Base

  extend Enumerize

  belongs_to :user

  validates :name, presence: true
  validates :expire_at, presence: true
  validates :employment, presence: true
  validates :skill_list, presence: true
  validate :expire_cannot_be_in_the_past

  enumerize :employment, in: [:full, :part, :remote]

  acts_as_taggable_on :skills

  def expire_cannot_be_in_the_past
    errors.add(:expiration_date, 'can\'t be in the past') if expire_at < Date.today
  end
end
