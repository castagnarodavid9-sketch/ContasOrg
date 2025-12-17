class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @debitos = Debito.where(userconf_id: current_user.userconf.id)
    @contrato_salario = Contrato.find_by(userconf_id: current_user.userconf.id)

    # CÁLCULOS PARA VIEW ####################################
    @total_dividas = 0
    @debitos.each do |dd|
      @total_dividas += dd.valor_debito
    end

    if @contrato_salario.present?
      @sobra_salario = (@contrato_salario.salario_liquido - @total_dividas)
    else
      @sobra_salario = "Nenhum dado inserido!"
    end
  end
end
