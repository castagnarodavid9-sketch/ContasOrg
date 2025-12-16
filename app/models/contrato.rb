class Contrato < ApplicationRecord
  has_one :userconf
  has_many :debito
end
