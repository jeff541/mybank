class ComptesController < ApplicationController
  before_action :set_compte, only: %i[ show edit update destroy set_amount update_amount ]

  # GET /comptes or /comptes.json
  def index
    @comptes = Compte.all
    if params[:search].present?
      @comptes = @comptes.where("LOWER(name) ILIKE :search ",
                                      search: "%#{params[:search][:criteria].downcase}%")
    end
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
  def set_amount

  end
  def update_amount
    @compte = Compte.find(params[:id])
    transaction_type = params[:compte][:transaction_type]
    transaction_amount = params[:compte][:transaction_amount].to_i
    @compte.set_amount(transaction_amount,transaction_type)
      redirect_to comptes_path, notice: 'Amount updated successfully.'
  end
  # POST /comptes or /comptes.json
  def create
    @compte = Compte.new(compte_params)

    respond_to do |format|
      if @compte.save
        format.html { redirect_to comptes_path, notice: "Compte was successfully created." }
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
        format.html { redirect_to comptes_path, notice: "Compte was successfully updated." }
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
