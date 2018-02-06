# frozen_string_literal: true

class DepositContractsController < ApplicationController
  before_action :set_deposit_contract, only: %i[show edit update destroy]

  # GET /deposit_contracts
  # GET /deposit_contracts.json
  def index
    @deposit_contracts = DepositContract.all
  end

  # GET /deposit_contracts/1
  # GET /deposit_contracts/1.json
  def show; end

  # GET /deposit_contracts/new
  def new
    @deposit_contract = DepositContract.new
  end

  # GET /deposit_contracts/1/edit
  def edit; end

  # POST /deposit_contracts
  # POST /deposit_contracts.json
  def create
    @deposit_contract = DepositContract.new(deposit_contract_params)

    respond_to do |format|
      if @deposit_contract.save
        format.html { redirect_to @deposit_contract, notice: 'Deposit contract was successfully created.' }
        format.json { render :show, status: :created, location: @deposit_contract }
      else
        format.html { render :new }
        format.json { render json: @deposit_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deposit_contracts/1
  # PATCH/PUT /deposit_contracts/1.json
  def update
    respond_to do |format|
      if @deposit_contract.update(deposit_contract_params)
        format.html { redirect_to @deposit_contract, notice: 'Deposit contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @deposit_contract }
      else
        format.html { render :edit }
        format.json { render json: @deposit_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deposit_contracts/1
  # DELETE /deposit_contracts/1.json
  def destroy
    @deposit_contract.destroy
    respond_to do |format|
      format.html { redirect_to deposit_contracts_url, notice: 'Deposit contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deposit_contract
    @deposit_contract = DepositContract.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def deposit_contract_params
    params.require(:deposit_contract).permit(:client_id, :deposit_id, :start_date, :end_date, :main_account,
                                             :current_account, :closed)
  end
end
