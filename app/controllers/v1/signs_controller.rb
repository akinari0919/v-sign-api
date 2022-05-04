class V1::SignsController < ApplicationController
  def index
    signs =  Sign.all.order(angle: :desc)
    rankers = Sign.count

    render json: {
             status: 200,
             signs: signs,
             rankers: rankers,
             message: 'success'
           }
  end

  def create
    sign = Sign.new(sign_params)

    if sign.save
      ranking =  Sign.all.order(angle: :desc)
      rankers = Sign.count
      ranking.each_with_index do |r, i|
        if sign.id == r.id
          @rank = i + 1
        end
      end

      render json: {
               status: 200,
               sign: sign,
               rank: @rank,
               rankers: rankers,
               message: 'success'
             }
    else
      render json: {
               status: 500,
               sign: nil,
               message: sign.errors
             }
    end
  end

  def destroy
    sign = Sign.find(params[:id])

    if sign.destroy
      render json: {
               status: 200,
               sign: sign,
               message: 'success'
             }
    else
      render json: {
               status: 500,
               sign: nil,
               message: sign.errors
             }
    end
  end

  private

  def sign_params
    params.require(:sign).permit(:name, :image, :angle, :type)
  end

end
