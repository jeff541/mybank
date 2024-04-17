class ComptesController < ApplicationController
  before_action :set_compte, only: %i[ show edit update destroy ]

  # GET /comptes or /comptes.json
  def index
    @comptes = Compte.all
  end

  # GET /comptes/1 or /comptes/1.json
  def show
  end

  # GET /comptes/new
  def new
    @compte = Compte.new
  end

  # GET /comptes/1/edit
  def edit
  end

  # POST /comptes or /comptes.json
  def create
    @compte = Compte.new(compte_params)

    respond_to do |format|
      if @compte.save
        format.html { redirect_to compte_url(@compte), notice: "Compte was successfully created." }
        format.json { render :show, status: :created, location: @compte }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @compte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comptes/1 or /comptes/1.json
  def update
    respond_to do |format|
      if @compte.update(compte_params)
        format.html { redirect_to compte_url(@compte), notice: "Compte was successfully updated." }
        format.json { render :show, status: :ok, location: @compte }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @compte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comptes/1 or /comptes/1.json
  def destroy
    @compte.destroy!

    respond_to do |format|
      format.html { redirect_to comptes_url, notice: "Compte was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compte
      @compte = Compte.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def compte_params
      params.require(:compte).permit(:name, :amount)
    end
end
