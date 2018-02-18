# frozen_string_literal: true

class CreditContractsController < ApplicationController
  respond_to :html

  # GET /credit_contracts
  # GET /credit_contracts.json
  def index
    @_resources = client.credit_contracts.includes(:main_account, :current_account, credit: %i[currency credit_type])
    render layout: 'application_fluid'
  end

  # GET /credit_contracts/1
  # GET /credit_contracts/1.json
  def show
    respond_with client, resource
  end

  # GET /credit_contracts/new
  def new
    respond_with client, @_resource = CreditContract.new
  end

  # GET /credit_contracts/1/edit
  def edit
    respond_with client, resource
  end

  # POST /credit_contracts
  # POST /credit_contracts.json
  def create
    respond_with client, @_resource = CreditContractService.new.create(client, credit_contract_params)
  end

  # PATCH/PUT /credit_contracts/1
  # PATCH/PUT /credit_contracts/1.json
  def update
    resource.update(deposit_contract_params)
    respond_with client, resource
  end

  def pay
    if CreditContractService.new.pay(credit_payment)
      flash[:notice] = 'Successfully paid'
    else
      flash[:error] = 'Error. Invalid data'
    end
    redirect_to [client, resource]
  end

  # DELETE /credit_contracts/1
  # DELETE /credit_contracts/1.json
  def destroy
    resource.destroy
    respond_with resource
  end

  private

  def client
    @_client ||= Client.find(params[:client_id])
  end

  def resource
    @_resource ||= CreditContract.find(params[:id] || params[:credit_contract_id])
  end

  def credit_contract_params
    params.require(:credit_contract).permit(:client_id, :credit_id, :contract_type, :amount)
  end

  def credit_payment
    @_credit_payment ||= CreditPayment.find(params[:credit_payment_id])
  end
end
