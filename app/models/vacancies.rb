class Vacancies < ActiveRecord::Base

  validates :name, presence: true
  validates :expire, presence: true
  validates :employment, presence: true

  belongs_to :user

end
