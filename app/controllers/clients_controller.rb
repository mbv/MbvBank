# frozen_string_literal: true

class ClientsController < ApplicationController
  respond_to :html

  # GET /clients
  # GET /clients.json
  def index
    @_resources = Client.all
    render layout: 'application_fluid'
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    respond_with resource
  end

  # GET /clients/new
  def new
    resource = Client.new
    respond_with resource
  end

  # GET /clients/1/edit
  def edit
    respond_with resource
  end

  # POST /clients
  # POST /clients.json
  def create
    resource = Client.new(client_params)
    resource.save
    respond_with resource
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    resource.update(client_params)
    respond_with resource
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    resource.destroy
    flash[:error] = 'Cannot delete client because dependent deposit/credit contracts exist' unless resource.errors.blank?
    redirect_back(fallback_location: clients_path)
  end

  private

  def resource
    @_resource ||= Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:first_name, :last_name, :middle_name, :birth_date, :birth_place, :gender,
                                   :passport_series, :passport_number, :identification_number, :passport_issued_by,
                                   :passport_issue_date, :home_phone_number, :mobile_phone_number, :email,
                                   :family_status, :disability, :pensioner, :monthly_income, :work_place,
                                   :work_position, :citizenship, :registration_city, :registration_address,
                                   :actual_city, :actual_address, :reservist)
  end
end
