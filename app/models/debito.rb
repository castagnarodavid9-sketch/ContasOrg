class Debito < ApplicationRecord
  has_one :userconf
  belongs_to :contrato
  scope :pagos, -> { where(:pago => false)}
  before_save :seta_cmpt
  validate :valida_campos

  def valida_campos
    # Valida vazios
    errors.add(:base, "Nome do débito não foi informado!") if !self.nome_debito.present?
    errors.add(:base, "Valor do débito não foi informado") if !self.valor_debito.present?
    errors.add(:base, "Data de vencimento do débito não foi informada!") if !self.data_vencimento.present?
    errors.add(:base, "Nenhum contrato selecionado!") if !self.contrato_id.present?

    # Valida formatos
    errors.add(:base, "Nome do débito não é válido!") if self.nome_debito.match?(/[*_|\/]/)
    errors.add(:base, "Formato de valor do débito não aceito!") if self.valor_debito.to_s.match?(/\A\d+\z/)

    # Valida valores inseridos
    errors.add(:base, "Débito não pode ser menor que R$ 0, 00 reais!") if self.valor_debito <= 0
  end

  private
  def seta_cmpt
    return nil unless self.data_vencimento.present?
    self.cmpt = CalculosSistema.gera_cmpt(self.data_vencimento)
  end
end
