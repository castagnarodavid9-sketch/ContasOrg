class Userconf < ApplicationRecord
  belongs_to :user
  belongs_to :contrato
  belongs_to :debito
end
