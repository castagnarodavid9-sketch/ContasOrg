class DebitosController < ApplicationController
  before_action :set_debito, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /debitos or /debitos.json
  def index
    @debitos = Debito.all
  end

  # GET /debitos/1 or /debitos/1.json
  def show
  end

  # GET /debitos/new
  def new
    @debito = Debito.new
  end

  # GET /debitos/1/edit
  def edit
  end

  # POST /debitos or /debitos.json
  def create
    nro_vezes = params[:nro_vezes].to_i
    valor_total = params[:debito][:valor_debito].to_f

    if valor_total <= 0
      return redirect_to new_debito_path, alert: "Valor do débito inválido."
    end

    begin
      data_inicio = params[:debito][:data_vencimento].to_date
    rescue ArgumentError
      return redirect_to new_debito_path, alert: "Data de vencimento inválida."
    end

    vlr_parcela = valor_total / nro_vezes

    ActiveRecord::Base.transaction do
      nro_vezes.times do |i|
        # Remove campos que não queremos sobrescrever
        @debito = Debito.new(debito_params.except(:cmpt, :data_vencimento, :nro_vezes))
        @debito.valor_debito = vlr_parcela
        @debito.cmpt = (data_inicio >> i).strftime("%Y%m") # competência sequencial
        @debito.nro_parcela = (i + 1)
        @debito.userconf_id = current_user.userconf.id
        @debito.save!
      end
    end

    redirect_to debitos_path, notice: "Débitos criados com sucesso."
  rescue ActiveRecord::RecordInvalid => e
    @debito = e.record
    render :new, status: :unprocessable_entity
  end

  # PATCH/PUT /debitos/1 or /debitos/1.json
  def update
    respond_to do |format|
      if @debito.update(debito_params)
        format.html { redirect_to @debito, notice: "Débito atualizado com sucesso.", status: :see_other }
        format.json { render :show, status: :ok, location: @debito }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @debito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debitos/1 or /debitos/1.json
  def destroy
    @debito.destroy!

    respond_to do |format|
      format.html { redirect_to debitos_path, notice: "Débito removido com sucesso.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_debito
    @debito = Debito.find(params[:id])
  end

  def debito_params
    # Apenas campos que queremos do form
    params.require(:debito).permit(:nome_debito, :valor_debito, :descricao, :contrato_id, :data_vencimento)
  end
end
