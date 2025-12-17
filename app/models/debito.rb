class Debito < ApplicationRecord
  has_one :userconf
  belongs_to :contrato
  scope :pagos, -> { where(:pago => false)}
end
