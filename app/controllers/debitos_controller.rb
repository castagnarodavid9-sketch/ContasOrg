class DebitosController < ApplicationController
  before_action :set_debito, only: %i[ show edit update destroy ]
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
    @debito = Debito.new(debito_params)
    @debito.userconf_id = current_user.userconf.id

    respond_to do |format|
      if @debito.save
        format.html { redirect_to @debito, notice: "Debito was successfully created." }
        format.json { render :show, status: :created, location: @debito }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @debito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debitos/1 or /debitos/1.json
  def update
    respond_to do |format|
      if @debito.update(debito_params)
        format.html { redirect_to @debito, notice: "Debito was successfully updated.", status: :see_other }
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
      format.html { redirect_to debitos_path, notice: "Debito was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debito
      @debito = Debito.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def debito_params
      params.expect(debito: [ :nome_debito, :valor_debito, :descricao, :data_vencimento, :contrato_id ])
    end
end
