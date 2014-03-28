class UserFields < ActiveRecord::Base
  extend Enumerize

  validates :employment, :skill_list, presence: true

  belongs_to :user

  enumerize :employment, in: [:full, :part, :remote]

  acts_as_taggable_on :skills
end
