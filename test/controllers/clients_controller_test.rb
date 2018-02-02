# frozen_string_literal: true

require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
  end

  test 'should get index' do
    get clients_url
    assert_response :success
  end

  test 'should get new' do
    get new_client_url
    assert_response :success
  end

  test 'should create client' do
    assert_difference('Client.count') do
      post clients_url, params: { client: { actual_address: @client.actual_address,
                                            actual_city: @client.actual_city,
                                            birth_date: @client.birth_date,
                                            birth_place: @client.birth_place,
                                            citizenship: @client.citizenship,
                                            disability: @client.disability,
                                            email: @client.email,
                                            family_status: @client.family_status,
                                            first_name: @client.first_name,
                                            gender: @client.gender,
                                            home_phone_number: @client.home_phone_number,
                                            identification_number: @client.identification_number,
                                            last_name: @client.last_name,
                                            middle_name: @client.middle_name,
                                            mobile_phone_number: @client.mobile_phone_number,
                                            monthly_income: @client.monthly_income,
                                            passport_issue_date: @client.passport_issue_date,
                                            passport_issued_by: @client.passport_issued_by,
                                            passport_number: @client.passport_number,
                                            passport_series: @client.passport_series,
                                            pensioner: @client.pensioner,
                                            registration_address: @client.registration_address,
                                            registration_city: @client.registration_city,
                                            reservist: @client.reservist,
                                            work_place: @client.work_place,
                                            work_position: @client.work_position } }
    end

    assert_redirected_to client_url(Client.last)
  end

  test 'should show client' do
    get client_url(@client)
    assert_response :success
  end

  test 'should get edit' do
    get edit_client_url(@client)
    assert_response :success
  end

  test 'should update client' do
    patch client_url(@client), params: { client: { actual_address: @client.actual_address,
                                                   actual_city: @client.actual_city,
                                                   birth_date: @client.birth_date,
                                                   birth_place: @client.birth_place,
                                                   citizenship: @client.citizenship,
                                                   disability: @client.disability,
                                                   email: @client.email,
                                                   family_status: @client.family_status,
                                                   first_name: @client.first_name,
                                                   gender: @client.gender,
                                                   home_phone_number: @client.home_phone_number,
                                                   identification_number: @client.identification_number,
                                                   last_name: @client.last_name,
                                                   middle_name: @client.middle_name,
                                                   mobile_phone_number: @client.mobile_phone_number,
                                                   monthly_income: @client.monthly_income,
                                                   passport_issue_date: @client.passport_issue_date,
                                                   passport_issued_by: @client.passport_issued_by,
                                                   passport_number: @client.passport_number,
                                                   passport_series: @client.passport_series,
                                                   pensioner: @client.pensioner,
                                                   registration_address: @client.registration_address,
                                                   registration_city: @client.registration_city,
                                                   reservist: @client.reservist,
                                                   work_place: @client.work_place,
                                                   work_position: @client.work_position } }
    assert_redirected_to client_url(@client)
  end

  test 'should destroy client' do
    assert_difference('Client.count', -1) do
      delete client_url(@client)
    end

    assert_redirected_to clients_url
  end
end
