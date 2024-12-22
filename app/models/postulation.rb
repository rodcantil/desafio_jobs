class Postulation < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :status, acceptance: {
    accept: %w[Postular]
  }

  def self.status
    %w[Postular]
  end



end
