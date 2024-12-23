class Postulation < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :status, acceptance: {
    accept: %w[Postulado]
  }

  def self.status
    %w[Postulado]
  end
end
