class Contrato < ApplicationRecord
  has_one :userconf
  has_many :debito
  before_save :formata_salario
  before_save :gera_hora_extra
  validate :valida_campos

  def gera_hora_extra
    return unless horas_semanais.present? && salario_bruto.present? && horas_semanais > 0

    horas_mensais = horas_semanais * 4.33
    self.horas_mensais = horas_mensais

    hora_normal = salario_bruto / horas_mensais
    hora_extra = hora_normal * 1.5

    self.vlr_hr_normal = hora_normal
    self.vlr_hr_extra = hora_extra
  end

  def valida_campos
    # Valida vazios
    errors.add(:base, "Nome da empresa não foi informado!") if !self.nome_empresa.present?
    errors.add(:base, "Salário bruto não foi informado!") if !self.salario_bruto.present?
    errors.add(:base, "Horas semanais não foram informadas!") if !self.horas_semanais.present?

    # Valida formatos
    errors.add(:base, "Nome da empresa não é válido!") if self.nome_empresa.match?(/[*_|\/]/)
    errors.add(:base, "Formato de salário não aceito!") if self.salario_bruto.to_s.match?(/\A\d+\z/)

    # Valida valores inseridos
    errors.add(:base, "Salário não pode ser menor que R$ 0, 00 reais!") if self.salario_bruto <= 0
    errors.add(:base, "Horas semanais não pode ser menor ou igual a 0") if self.horas_semanais <= 0
  end

  def formata_salario
    self.salario_liquido = CalculosLegislacao.calcula_salario_liquido(self.salario_bruto)
  end
end