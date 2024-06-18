class DettesController < ApplicationController
  before_action :set_dette, only: %i[ show edit update destroy set_amount update_amount ]

  # GET /comptes or /comptes.json
  def index
    @dettes = Dette.all
    if params[:search].present?
      @dettes = @dettes.where("LOWER(name) ILIKE :search ",
                                search: "%#{params[:search][:criteria].downcase}%")
    end
  end

  # GET /comptes/1 or /comptes/1.json
  def show
  end

  # GET /comptes/new
  def new
    @dette = Dette.new
  end

  # GET /comptes/1/edit
  def edit
  end
  def set_amount

  end
  def update_amount
    @dette = Dette.find(params[:id])
    transaction_type = params[:dette][:transaction_type]
    transaction_amount = params[:dette][:transaction_amount].to_i
    @dette.set_amount(transaction_amount,transaction_type)
    redirect_to dettes_path, notice: 'Debt updated successfully.'
  end
  # POST /comptes or /comptes.json
  def create
    @dette = Dette.new(dette_params)

    respond_to do |format|
      if @dette.save
        format.html { redirect_to dettes_path, notice: "Compte was successfully created." }
        format.json { render :show, status: :created, location: @dette }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comptes/1 or /comptes/1.json
  def update
    respond_to do |format|
      if @dette.update(dette_params)
        format.html { redirect_to dettes_path, notice: "Dette was successfully updated." }
        format.json { render :show, status: :ok, location: @dette }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comptes/1 or /comptes/1.json
  def destroy
    @dette.destroy!

    respond_to do |format|
      format.html { redirect_to dettes_path, notice: "Dette was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_dette
    @dette = Dette.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dette_params
    params.require(:dette).permit(:name, :amount)
  end
end
