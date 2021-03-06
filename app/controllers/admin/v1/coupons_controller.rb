module Admin::V1
  class CouponsController < ApiController
    before_action :load_coupon, only: [:update, :destroy]
    def index
      @coupons = Coupon.all
    end

    def create
      @coupon = Coupon.new
      @coupon.attributes = coupon_params
      save_coupon!
    end

    def update
      @coupon.attributes = params_coupon
      save_coupon!
    end

    def destroy
      @coupon.destroy!
    rescue
      render_error(fields: @coupon.errors.messages)
    end

    private

    def coupon_params
      return {} unless  params.has_key?(:coupon)
      params.require(:coupon).permit(:code, :status, :discount_value, :due_date)
    end

    def save_coupon!
      @coupon.save!
      render :show
    rescue
      render_error(fields: @coupon.errors.messages)
    end

    def load_coupon
      @coupon = Coupon.find(params[:id])
    end

    def params_coupon
      return {} unless params.has_key?(:coupon)
      params.require(:coupon).permit(:code, :status, :discount_value, :due_date)
    end

  end
end