class Debito < ApplicationRecord
  #paginates_per 5
  has_one :userconf
  belongs_to :contrato
  validate :valida_campos

  def valida_campos
    # Valida vazios
    errors.add(:base, "Nome do débito não foi informado!") if !self.nome_debito.present?
    errors.add(:base, "Valor do débito não foi informado") if !self.valor_debito.present?
    errors.add(:base, "Nenhum contrato selecionado!") if !self.contrato_id.present?

    # Valida formatos
    errors.add(:base, "Nome do débito não é válido!") if self.nome_debito.match?(/[*_|\/]/)
    errors.add(:base, "Formato de valor do débito não aceito!") if self.valor_debito.to_s.match?(/\A\d+\z/)

    # Valida valores inseridos
    errors.add(:base, "Débito não pode ser menor que R$ 0, 00 reais!") if self.valor_debito <= 0
  end
end
