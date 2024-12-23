class Offer < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :postulations, dependent: :destroy


  def count_with_status(arg)
    number = self.postulations.where(status: arg).count
    "Esta oferta tiene #{number} postulaciones"
  end

  def find_status_user_relation(user)
    self.postulations.find_by(user_id: user.id).status
  end
end
