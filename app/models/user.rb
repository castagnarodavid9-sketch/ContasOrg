class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :userconf, dependent: :destroy
  accepts_nested_attributes_for :userconf
  before_save :seta_email

  private

  def seta_email
    return unless userconf.present?

    userconf.email = email
  end
end
