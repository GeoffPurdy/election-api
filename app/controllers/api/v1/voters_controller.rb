class API::V1::VotersController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :load_user, only: [:show, :update]
  before_filter :restrict_access_to_user, only: [:update]

  def index
    @voters = Voter.all
    render json: @voters
  end

  def show
    render json: @voters
  end

  def create
    @voter = Voter.new(voters_params)
    if @voter.save
      render json: @voter.as_json(include_token: true), status: :created, location: api_v1_voter_path(@voter)
    else
      render json: {errors: @voter.errors}, status: :bad_request
    end
  end

  def update
    if @voter.update(voter_params)
      render json: @voter, status: :ok
    else
      render json: {errors: @voter.errors}, status: :bad_request
    end
  end

  private

  def load_user
    @voter = Voter.find(params[:id])
  end

  def restrict_access_to_user
    # authenticate_or_request_with_http_token do |token, options|
    #   @voter.token == token
    # end

    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
  end

  def voter_params
    params.require(:voter).permit(:name, :email, :city, :state)
  end
end
