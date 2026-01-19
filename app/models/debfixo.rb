class Debfixo < ApplicationRecord
  has_one :userconf
  belongs_to :contrato
  scope :nao_quitado, -> { where(:quitado => false)}
  before_save :gera_cmpt_final
  validate :valida_campos

  def valida_campos
    # Valida campos presença
    errors.add(:base, "Nome de débito fixo não foi informado!") if !self.nome_debfx.present?
    errors.add(:base, "Valor de débito fixo não foi informado!") if !self.valor_debfx.present?

    # Valida valores
    errors.add(:base, "Nome informado não é válido!") if self.nome_debfx.match?(/[*_|\/]/)
    errors.add(:base, "Formato de valor não aceito!") if self.valor_debfx.to_s.match?(/\A\d+\z/)
    errors.add(:base, "Débito não pode ser menor que R$ 0, 00 reais!") if self.valor_debfx <= 0

  end

  private

  def gera_cmpt_final
    return unless cmpt_ini.present? && parcela.present?

    ano  = cmpt_ini.to_s[0,4].to_i
    mes  = cmpt_ini.to_s[-2..].to_i

    data = Date.new(ano, mes, 1) + parcela.months

    self.cmpt_fim = data.strftime("%Y%m").to_s
  end

end
