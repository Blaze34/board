# == Schema Information
#
# Table name: user_fields
#
#  id                :integer          not null, primary key
#  employment        :string(255)
#  salary            :integer
#  experience        :integer
#  learning_place    :text
#  user_id           :integer
#  cached_skill_list :string(255)
#

class UserFields < ActiveRecord::Base
  extend Enumerize

  validates :employment, :skill_list, presence: true

  belongs_to :user

  enumerize :employment, in: [:full, :part, :remote]

  acts_as_taggable_on :skills
end
