class Vacancy < ActiveRecord::Base

  validates :name, presence: true
  validates :expire, presence: true
  validates :employment, presence: true
  validates :skill_list, presence: true

  belongs_to :user

  acts_as_taggable_on :skills
end
