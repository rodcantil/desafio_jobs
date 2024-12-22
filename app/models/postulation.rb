class Postulation < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :status, acceptance: {
    accept: %w[postulado]
  }

  def self.status
    %w[postulado]
  end
end
