class Debfixo < ApplicationRecord
  has_one :userconf
  belongs_to :contrato
end
