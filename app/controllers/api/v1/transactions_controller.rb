
class Api::V1::TransactionsController < ApplicationController
  before_action :init_user, :check_code, :check_credit,
                :check_credit, :check_balance, :check_receiver

  def index
    transaction = Transaction.all
    json_render transaction, status: :ok
  end

  def create
    transaction = Transaction.create!(
      transaction_params.merge(user_id: @user.id)
    )
    if transaction.save
      json_render transaction, status: :created
    else
      render_error transaction.errors.full_messages
    end
  end

  def destroy
    @transaction = Transaction.find_by(params[:id])
    @transaction.destroy
  end

  private

  def init_user
    @sender_balance = params[:sender_balance].to_i
    @user = User.find_or_initialize_by(
      sender_number: params[:sender_number]
    ) do |new_user|
      new_user.pass_code = params[:pass_code]
      new_user.save
    end
    render_error @user.errors.full_messages unless @user.persisted?
  end

  def check_balance
    valid_balance = @sender_balance >= 50
    render_error 'Invalid account balance, your balance must be over 50' unless valid_balance
  end

  def check_credit
    credit = params[:credit_amount]
    if @sender_balance < credit
      render_error 'Transaction failed, Your balance is low'
    elsif @sender_balance < credit + 10
      render_error 'Transaction failed, Service charge of 10 naira is required'
    elsif credit < 500
      render_error 'Minimum Allowed Transfer is 500'
    end
  end

  def check_receiver
    render_error 'Receiver\'s number is invalid' unless Validator.valid_number? params[:receiver_number]
  end

  def check_code
    pass_code = params[:pass_code]
    if pass_code.length != 4
      render_error 'pass code must four digit long'
    elsif !!(pass_code =~ /\D{4}/)
      render_error 'only digits are allowed in the pass code'
    elsif @user.pass_code != pass_code && @user.persisted?
      render_error 'Incorrect pass code, please retry'
    end
  end

  def transaction_params
    params.require(:transaction).permit(
      :sender_number, :pass_code, :sender_balance,
      :credit_amount, :receiver_number
    )
  end
end
