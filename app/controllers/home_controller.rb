class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    cmpt_atual = CalculosSistema.gera_cmpt(Date.today)

    @debitos = Debito.where(userconf_id: current_user.userconf.id)    

    if params[:search].present?     
      @debitos = @debitos.where("cmpt LIKE ? ", "%#{params[:search]}%")
      puts "Debitos #{@debitos.to_sql}"
    else
      @debitos = @debitos.where("cmpt LIKE ? ", cmpt_atual)
    end

    #@debitos = @debitos.page(params[:page]).per(5)

    @contratos = Contrato.all
    @contrato_salario = Contrato.find_by(userconf_id: current_user.userconf.id)

    # CÁLCULOS PARA VIEW ####################################
    @total_dividas = 0
    @debitos.each do |dd|
      @total_dividas += dd.valor_debito
    end

    if @contrato_salario.present?
      @sobra_salario = (@contrato_salario.salario_liquido - @total_dividas)
    else
      @sobra_salario = 0
    end
  end
end
