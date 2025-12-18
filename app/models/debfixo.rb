class Debfixo < ApplicationRecord
  has_one :userconf
  belongs_to :contrato
  scope :nao_quitado, -> { where(:quitado => false)}
  before_save :gera_competencia
  validate :valida_campos

  def valida_campos
    # Valida campos presença
    errors.add(:base, "Nome de débito fixo não foi informado!") if !self.nome_debfx.present?
    errors.add(:base, "Valor de débito fixo não foi informado!") if !self.valor_debfx.present?

    # Valida valores
    errors.add(:base, "Nome informado não é válido!") if self.nome_debfx.match?(/[*_|\/]/)
    errors.add(:base, "Formato de valor não aceito!") if self.valor_debfx.to_s.match?(/\A\d+\z/)
    errors.add(:base, "Débito não pode ser menor que R$ 0, 00 reais!") if self.valor_debfx <= 0

    # Valida regra de negocio
    errors.add(:base, "Data inicial do débito não pode ser maior que a data final!") if CalculosSistema.gera_cmpt(self.cmpt_ini) > CalculosSistema.gera_cmpt(self.cmpt_fim)
    errors.add(:base, "Data inicial do débito não pode ser igual a data final!") if CalculosSistema.gera_cmpt(self.cmpt_ini) == CalculosSistema.gera_cmpt(self.cmpt_fim)
  end

  private
  def gera_competencia
    if self.cmpt_ini.present? && self.cmpt_fim.present?
      self.cmpt_ini = CalculosSistema.gera_cmpt(self.cmpt_ini)
      self.cmpt_fim = CalculosSistema.gera_cmpt(self.cmpt_fim)
    end
  end
end
