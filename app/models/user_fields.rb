class UserFields < ActiveRecord::Base
  extend Enumerize


  belongs_to :user

  enumerize :employment, in: [:full, :part, :remote]
end
