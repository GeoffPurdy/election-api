class API::V1::VotesController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :load_user, only: [:show, :update]
  before_filter :restrict_access_to_user, only: [:update]

  def index
    @votes = Vote.all
    render json: @votes
  end

  def show
    render json: @votes
  end

  def create
    @vote = Vote.new(votes_params)
    if @vote.save
      render json: @vote.as_json(include_token: true), status: :created, location: api_v1_vote_path(@vote)
    else
      render json: {errors: @vote.errors}, status: :bad_request
    end
  end

  def update
    if @vote.update(vote_params)
      render json: @vote, status: :ok
    else
      render json: {errors: @vote.errors}, status: :bad_request
    end
  end

  private

  def load_user
    @vote = Vote.find(params[:id])
  end

  def restrict_access_to_user
    unless @vote.voter.api_key == params[:api_key]
      render nothing: true, status: :unauthorized
    end
  end

  def vote_params
    params.require(:vote).permit(:voter, :seat, :candidate)
  end
end
