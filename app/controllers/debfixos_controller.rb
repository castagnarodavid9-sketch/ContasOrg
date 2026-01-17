class DebfixosController < ApplicationController
  before_action :set_debfixo, only: %i[ show edit update destroy ]

  # GET /debfixos or /debfixos.json
  def index
    @debfixos = Debfixo.all
  end

  # GET /debfixos/1 or /debfixos/1.json
  def show
  end

  # GET /debfixos/new
  def new
    @debfixo = Debfixo.new
  end

  # GET /debfixos/1/edit
  def edit
  end

  # POST /debfixos or /debfixos.json
  def create
    @debfixo = Debfixo.new(debfixo_params)
    @debfixo.userconf_id = current_user.userconf.id

    respond_to do |format|
      if @debfixo.save
        format.html { redirect_to @debfixo, notice: "Debfixo was successfully created." }
        format.json { render :show, status: :created, location: @debfixo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @debfixo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debfixos/1 or /debfixos/1.json
  def update
    respond_to do |format|
      if @debfixo.update(debfixo_params)
        format.html { redirect_to @debfixo, notice: "Debfixo was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @debfixo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @debfixo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debfixos/1 or /debfixos/1.json
  def destroy
    @debfixo.destroy!

    respond_to do |format|
      format.html { redirect_to debfixos_path, notice: "Debfixo was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debfixo
      @debfixo = Debfixo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def debfixo_params
      params.expect(debfixo: [ :nome_debfx, :valor_debfx, :cmpt_ini, :cmpt_fim, :quitado, :contrato_id, :parcela ])
    end
end
