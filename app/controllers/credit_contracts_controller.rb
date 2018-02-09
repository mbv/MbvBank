class CreditContractsController < ApplicationController
  before_action :set_credit_contract, only: [:show, :edit, :update, :destroy]

  # GET /credit_contracts
  # GET /credit_contracts.json
  def index
    @credit_contracts = CreditContract.all
  end

  # GET /credit_contracts/1
  # GET /credit_contracts/1.json
  def show
  end

  # GET /credit_contracts/new
  def new
    @credit_contract = CreditContract.new
  end

  # GET /credit_contracts/1/edit
  def edit
  end

  # POST /credit_contracts
  # POST /credit_contracts.json
  def create
    @credit_contract = CreditContract.new(credit_contract_params)

    respond_to do |format|
      if @credit_contract.save
        format.html { redirect_to @credit_contract, notice: 'Credit contract was successfully created.' }
        format.json { render :show, status: :created, location: @credit_contract }
      else
        format.html { render :new }
        format.json { render json: @credit_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_contracts/1
  # PATCH/PUT /credit_contracts/1.json
  def update
    respond_to do |format|
      if @credit_contract.update(credit_contract_params)
        format.html { redirect_to @credit_contract, notice: 'Credit contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_contract }
      else
        format.html { render :edit }
        format.json { render json: @credit_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_contracts/1
  # DELETE /credit_contracts/1.json
  def destroy
    @credit_contract.destroy
    respond_to do |format|
      format.html { redirect_to credit_contracts_url, notice: 'Credit contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_contract
      @credit_contract = CreditContract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_contract_params
      params.require(:credit_contract).permit(:client_id, :credit_id, :contract_type, :start_date, :end_date, :main_account_id, :current_account_id, :next_payment_id, :closed)
    end
end
