class Contrato < ApplicationRecord
  has_one :userconf
  has_many :debito
  before_save :formata_salario

  def formata_salario
    self.salario_liquido = CalculosLegislacao.calcula_salario_liquido(self.salario_bruto)
  end
end