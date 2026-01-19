class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    cmpt_atual = CalculosSistema.gera_cmpt(Date.today)

    @debitos = Debito.pagos.where(userconf_id: current_user.userconf.id)
    @search = ""

    if params[:search].present? || @search.present?
      @search = params[:search]
      @debitos = @debitos.where("cmpt LIKE ? ", "%#{@search}%")
    else
      @debitos = @debitos.where("cmpt LIKE ? ", cmpt_atual)
    end

    @debitos = @debitos.page(params[:page]).per(5)

    @debfixos = Debfixo.nao_quitado.where(userconf_id: current_user.userconf.id).where("? BETWEEN cmpt_ini AND cmpt_fim", cmpt_atual)
    @contratos = Contrato.all
    @contrato_salario = Contrato.find_by(userconf_id: current_user.userconf.id)

    # CÁLCULOS PARA VIEW ####################################
    @total_dividas = 0
    @debitos.each do |dd|
      @total_dividas += dd.valor_debito
    end

    # @debfixos.each do |db|
    #   @total_dividas += db.valor_debfx
    # end


    if @contrato_salario.present?
      @sobra_salario = (@contrato_salario.salario_liquido - @total_dividas)
    else
      @sobra_salario = 0
    end
  end
end
