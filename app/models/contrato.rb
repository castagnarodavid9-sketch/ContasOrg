class Contrato < ApplicationRecord
  has_one :userconf
  has_many :debito
  has_many :debfixo
  before_save :formata_salario
  before_save :gera_hora_extra

  def gera_hora_extra
    return unless horas_semanais.present? && salario_bruto.present? && horas_semanais > 0

    horas_mensais = horas_semanais * 4.33
    self.horas_mensais = horas_mensais

    hora_normal = salario_bruto / horas_mensais
    hora_extra = hora_normal * 1.5

    self.vlr_hr_normal = hora_normal
    self.vlr_hr_extra = hora_extra
  end

  def formata_salario
    self.salario_liquido = CalculosLegislacao.calcula_salario_liquido(self.salario_bruto)
  end
end