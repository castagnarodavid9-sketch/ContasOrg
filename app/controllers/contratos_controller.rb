class ContratosController < ApplicationController
  before_action :set_contrato, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /contratos or /contratos.json
  def index
    @contratos = Contrato.all
  end

  # GET /contratos/1 or /contratos/1.json
  def show
  end

  # GET /contratos/new
  def new
    @contrato = Contrato.new
  end

  # GET /contratos/1/edit
  def edit
  end

  # POST /contratos or /contratos.json
  def create
    @contrato = Contrato.new(contrato_params)
    @contrato.userconf_id = current_user.userconf.id
    @contrato.salario_bruto = remove_formato_moeda(params[:contrato][:salario_bruto]) || 0

    respond_to do |format|
      if @contrato.save
        format.html { redirect_to @contrato, notice: "Contrato was successfully created." }
        format.json { render :show, status: :created, location: @contrato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contratos/1 or /contratos/1.json
  def update
    respond_to do |format|
      if @contrato.update(contrato_params)
        format.html { redirect_to @contrato, notice: "Contrato was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @contrato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contratos/1 or /contratos/1.json
  def destroy
    @contrato.destroy!

    respond_to do |format|
      format.html { redirect_to contratos_path, notice: "Contrato was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contrato
      @contrato = Contrato.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def contrato_params
      params.require(:contrato).permit(:nome_empresa, :salario_bruto, :salario_liquido, :horas_semanais)
    end

    def remove_formato_moeda(valor)
      valor
        .gsub(/[^\d,]/, "")
        .gsub(",", ".")
        .to_f
    end
end
