require 'test_helper'

class CreditContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_contract = credit_contracts(:one)
  end

  test "should get index" do
    get credit_contracts_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_contract_url
    assert_response :success
  end

  test "should create credit_contract" do
    assert_difference('CreditContract.count') do
      post credit_contracts_url, params: { credit_contract: { client_id: @credit_contract.client_id, closed: @credit_contract.closed, contract_type: @credit_contract.contract_type, credit_id: @credit_contract.credit_id, current_account_id: @credit_contract.current_account_id, end_date: @credit_contract.end_date, main_account_id: @credit_contract.main_account_id, next_payment_id: @credit_contract.next_payment_id, start_date: @credit_contract.start_date } }
    end

    assert_redirected_to credit_contract_url(CreditContract.last)
  end

  test "should show credit_contract" do
    get credit_contract_url(@credit_contract)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_contract_url(@credit_contract)
    assert_response :success
  end

  test "should update credit_contract" do
    patch credit_contract_url(@credit_contract), params: { credit_contract: { client_id: @credit_contract.client_id, closed: @credit_contract.closed, contract_type: @credit_contract.contract_type, credit_id: @credit_contract.credit_id, current_account_id: @credit_contract.current_account_id, end_date: @credit_contract.end_date, main_account_id: @credit_contract.main_account_id, next_payment_id: @credit_contract.next_payment_id, start_date: @credit_contract.start_date } }
    assert_redirected_to credit_contract_url(@credit_contract)
  end

  test "should destroy credit_contract" do
    assert_difference('CreditContract.count', -1) do
      delete credit_contract_url(@credit_contract)
    end

    assert_redirected_to credit_contracts_url
  end
end
