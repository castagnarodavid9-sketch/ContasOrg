class Debfixo < ApplicationRecord
  has_one :userconf
  belongs_to :contrato
  scope :nao_quitado, -> { where(:quitado => false)}
  before_save :gera_competencia

  private
  def gera_competencia
    if self.cmpt_ini.present? && self.cmpt_fim.present?
      self.cmpt_ini = CalculosSistema.gera_cmpt(self.cmpt_ini)
      self.cmpt_fim = CalculosSistema.gera_cmpt(self.cmpt_fim)
    end
  end
end
