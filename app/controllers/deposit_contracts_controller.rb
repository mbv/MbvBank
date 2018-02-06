# frozen_string_literal: true

class DepositContractsController < ApplicationController
  before_action :set_deposit_contract, only: %i[show edit update destroy]

  respond_to :html

  # GET /deposit_contracts
  # GET /deposit_contracts.json
  def index
    @deposit_contracts = DepositContract.all
    render layout: 'application_fluid'
  end

  # GET /deposit_contracts/1
  # GET /deposit_contracts/1.json
  def show
    respond_with @deposit_contract
  end

  # GET /deposit_contracts/new
  def new
    @deposit_contract = DepositContract.new
    respond_with @deposit_contract
  end

  # GET /deposit_contracts/1/edit
  def edit; end

  # POST /deposit_contracts
  # POST /deposit_contracts.json
  def create
    @deposit_contract = DepositContractService.new.create(deposit_contract_params)
    respond_with @deposit_contract
  end

  # PATCH/PUT /deposit_contracts/1
  # PATCH/PUT /deposit_contracts/1.json
  def update
    @deposit_contract.update(deposit_contract_params)

    respond_with @deposit_contract
  end

  # DELETE /deposit_contracts/1
  # DELETE /deposit_contracts/1.json
  def destroy
    @deposit_contract.destroy
    respond_with @deposit_contract
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deposit_contract
    @deposit_contract = DepositContract.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def deposit_contract_params
    params.require(:deposit_contract).permit(:client_id, :deposit_id, :start_date, :end_date, :closed, :amount)
  end
end
