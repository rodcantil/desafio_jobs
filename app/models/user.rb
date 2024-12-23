class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable


        has_many :offers
        has_many :postulations
        has_one_attached :image

        enum :role, [ :user, :admin ]
end
