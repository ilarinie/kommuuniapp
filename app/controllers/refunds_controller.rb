class RefundsController < ApplicationController
  before_action :ensure_that_signed_in

  def new
    @refund = Refund.new
    @users = User.all.where.not(id:current_user.id)
  end

  def create
    @refund = Refund.new(refund_params)
    @refund.confirmed = false
    @refund.payer_id = current_user.id
    if @refund.save
      redirect_to :root, notice: 'Refund registered, waiting for confirmation'
    else
      render :new
    end
  end

  def confirm
    @refund = Refund.find(params["format"])
    if @refund.receiver_id == current_user.id
      if @refund.update(confirmed:true)
        plus = Purchase.new(user_id:@refund.payer_id, price:@refund.amount, description:refund_description(@refund))
        minus = Purchase.new(user_id:@refund.receiver_id, price:@refund.amount*(-1), description:refund_description(@refund))
        if plus.save && minus.save(validate: false)
          redirect_to :back, notice: 'Confirmed succesfully'
        else
          redirect_to :back, alert: 'Something went wrong'
        end
      else
        redirect_to :back, alert: 'Error confirming refund, try again'
      end
    else
      redirect_to :root, alert: 'Only receiver can confirm refund.'
    end
  end

  def cancel
    @refund = Refund.find(params["format"])
    if (@refund.receiver_id == current_user.id || @refund.payer_id == current_user.id) && !@refund.confirmed
      if @refund.destroy
        redirect_to :back, notice: 'Refund cancelled, have a nice day'
      else
        redirect_to :back, alert: 'Error error, try again please'
      end
    else
      redirect_to :root, alert: 'Refund already confirmed or none of your business'
    end
  end




  def refund_description refund
    "Refund from "+User.find(refund.payer_id).to_s+" to "+User.find(refund.receiver_id).to_s+" amount: "+refund.amount.to_s
  end

private

  def refund_params
      params.require(:refund).permit(:amount, :receiver_id,:confirmed)
  end
end
