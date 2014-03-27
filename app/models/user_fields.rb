class UserFields < ActiveRecord::Base
  extend Enumerize

  validates :employment, presence: true

  belongs_to :user

  enumerize :employment, in: [:full, :part, :remote]
end
