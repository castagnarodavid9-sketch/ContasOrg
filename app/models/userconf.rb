class Userconf < ApplicationRecord
  belongs_to :user
  belongs_to :contrato, optional: true
  belongs_to :debito, optional: true
end
