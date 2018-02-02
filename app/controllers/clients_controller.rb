# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]

  respond_to :html

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
    render layout: 'application_fluid'
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    respond_with @client
  end

  # GET /clients/new
  def new
    @client = Client.new
    respond_with @client
  end

  # GET /clients/1/edit
  def edit; end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    @client.save
    respond_with @client
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    @client.update(client_params)
    respond_with @client
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_with @client
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def client_params
    params.require(:client).permit(:first_name, :last_name, :middle_name, :birth_date, :birth_place, :gender,
                                   :passport_series, :passport_number, :identification_number, :passport_issued_by,
                                   :passport_issue_date, :home_phone_number, :mobile_phone_number, :email,
                                   :family_status, :disability, :pensioner, :monthly_income, :work_place,
                                   :work_position, :citizenship, :registration_city, :registration_address,
                                   :actual_city, :actual_address, :reservist)
  end
end
