class API::V1::SeatsController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def index
    @seats = Seat.all
    render json: @seats
  end

  def show
    render json: @seats
  end

  def create
    @seat = Voter.new(seats_params)
    if @seat.save
      render json: @seat.as_json(include_token: true), status: :created, location: api_v1_seat_path(@seat)
    else
      render json: {errors: @seat.errors}, status: :bad_request
    end
  end

  def update
    if @seat.update(seat_params)
      render json: @seat, status: :ok
    else
      render json: {errors: @seat.errors}, status: :bad_request
    end
  end

  private

  def load_user
    @seat = Seat.find(params[:id])
  end

  def seat_params
    params.require(:seat).permit(:name)
  end
end
