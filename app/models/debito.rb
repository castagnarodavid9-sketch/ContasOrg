class Debito < ApplicationRecord
  has_one :userconf
  belongs_to :contrato
  scope :pagos, -> { where(:pago => false)}
  before_save :seta_cmpt

  private
  def seta_cmpt
    return nil unless self.data_vencimento.present?
    self.cmpt = CalculosSistema.gera_cmpt(self.data_vencimento)
  end
end
