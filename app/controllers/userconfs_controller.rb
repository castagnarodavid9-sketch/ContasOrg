class UserconfsController < ApplicationController
  before_action :set_userconf, only: %i[ show edit update destroy ]

  # GET /userconfs or /userconfs.json
  def index
    @userconfs = Userconf.all
  end

  # GET /userconfs/1 or /userconfs/1.json
  def show
  end

  # GET /userconfs/new
  def new
    @userconf = Userconf.new
  end

  # GET /userconfs/1/edit
  def edit
  end

  # POST /userconfs or /userconfs.json
  def create
    @userconf = Userconf.new(userconf_params)

    respond_to do |format|
      if @userconf.save
        format.html { redirect_to @userconf, notice: "Userconf was successfully created." }
        format.json { render :show, status: :created, location: @userconf }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @userconf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userconfs/1 or /userconfs/1.json
  def update
    respond_to do |format|
      if @userconf.update(userconf_params)
        format.html { redirect_to @userconf, notice: "Userconf was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @userconf }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @userconf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userconfs/1 or /userconfs/1.json
  def destroy
    @userconf.destroy!

    respond_to do |format|
      format.html { redirect_to userconfs_path, notice: "Userconf was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userconf
      @userconf = Userconf.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def userconf_params
      params.fetch(:userconf, {})
    end
end
