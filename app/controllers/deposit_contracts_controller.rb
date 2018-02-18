# frozen_string_literal: true

class DepositContractsController < ApplicationController
  respond_to :html

  # GET /deposit_contracts
  # GET /deposit_contracts.json
  def index
    @_resources = client.deposit_contracts.includes(:main_account, :current_account, deposit: %i[currency deposit_type])
    render layout: 'application_fluid'
  end

  # GET /deposit_contracts/1
  # GET /deposit_contracts/1.json
  def show
    respond_with client, resource
  end

  # GET /deposit_contracts/new
  def new
    respond_with client, @_resource = DepositContract.new
  end

  # GET /deposit_contracts/1/edit
  def edit
    respond_with client, resource
  end

  def revoke
    DepositContractService.new.revoke(resource)
    flash[:notice] = 'Successfully revoked'
    redirect_to action: :index
  end

  # POST /deposit_contracts
  # POST /deposit_contracts.json
  def create
    respond_with client, @_resource = DepositContractService.new.create(client, deposit_contract_params)
  end

  # PATCH/PUT /deposit_contracts/1
  # PATCH/PUT /deposit_contracts/1.json
  def update
    resource.update(deposit_contract_params)
    respond_with client, resource
  end

  # DELETE /deposit_contracts/1
  # DELETE /deposit_contracts/1.json
  def destroy
    resource.destroy
    respond_with resource
  end

  private

  def client
    @_client ||= Client.find(params[:client_id])
  end

  def resource
    @_resource ||= DepositContract.find(params[:id])
  end

  def deposit_contract_params
    params.require(:deposit_contract).permit(:client_id, :deposit_id, :start_date, :end_date, :closed, :amount)
  end
end
