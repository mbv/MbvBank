require 'test_helper'

class DepositContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deposit_contract = deposit_contracts(:one)
  end

  test "should get index" do
    get deposit_contracts_url
    assert_response :success
  end

  test "should get new" do
    get new_deposit_contract_url
    assert_response :success
  end

  test "should create deposit_contract" do
    assert_difference('DepositContract.count') do
      post deposit_contracts_url, params: { deposit_contract: { client_id: @deposit_contract.client_id, closed: @deposit_contract.closed, current_account: @deposit_contract.current_account, deposit_id: @deposit_contract.deposit_id, end_date: @deposit_contract.end_date, main_account: @deposit_contract.main_account, start_date: @deposit_contract.start_date } }
    end

    assert_redirected_to deposit_contract_url(DepositContract.last)
  end

  test "should show deposit_contract" do
    get deposit_contract_url(@deposit_contract)
    assert_response :success
  end

  test "should get edit" do
    get edit_deposit_contract_url(@deposit_contract)
    assert_response :success
  end

  test "should update deposit_contract" do
    patch deposit_contract_url(@deposit_contract), params: { deposit_contract: { client_id: @deposit_contract.client_id, closed: @deposit_contract.closed, current_account: @deposit_contract.current_account, deposit_id: @deposit_contract.deposit_id, end_date: @deposit_contract.end_date, main_account: @deposit_contract.main_account, start_date: @deposit_contract.start_date } }
    assert_redirected_to deposit_contract_url(@deposit_contract)
  end

  test "should destroy deposit_contract" do
    assert_difference('DepositContract.count', -1) do
      delete deposit_contract_url(@deposit_contract)
    end

    assert_redirected_to deposit_contracts_url
  end
end
