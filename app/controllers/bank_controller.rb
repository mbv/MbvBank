# frozen_string_literal: true

class BankController < ApplicationController
  def stats
    @bank_fund_accounts = Account.includes(:currency).where(account_type: :bank_development_fund).all
  end

  def submit_day
    BankService.new.submit_bank_day
    redirect_to action: :stats
  end
end
