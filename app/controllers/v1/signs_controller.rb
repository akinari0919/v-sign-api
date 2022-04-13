class V1::SignsController < ApplicationController
  def index
    render json: { status: 200, message: 'success' }
  end

  def create
    sign = Sign.new(sign_params)

    if sign.save
      render json: { status: 200, sign: sign, message: 'success' }
    else
      render json: { status: 500, sign: nil, message: sign.errors }
    end
  end

  def destroy
    sign = Sign.find(params[:id])

    if sign.destroy
      render json: { status: 200, sign: sign, message: 'success' }
    else
      render json: { status: 500, sign: nil, message: sign.errors }
    end
  end

  private

  def sign_params
    params.require(:sign).permit(:name)
  end
end
