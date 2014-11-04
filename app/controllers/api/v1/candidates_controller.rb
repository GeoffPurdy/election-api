class API::V1::CandidatesController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def index
    @candidates = Candidate.all
    render json: @candidates
  end

  def show
    render json: @candidates
  end

  def create
    @candidate = Candidate.new(voters_params)
    if @candidate.save
      render json: @candidate.as_json(include_token: true), status: :created, location: api_v1_candidate_path(@candidate)
    else
      render json: {errors: @candidate.errors}, status: :bad_request
    end
  end

  def update
    if @candidate.update(candidate_params)
      render json: @candidate, status: :ok
    else
      render json: {errors: @candidate.errors}, status: :bad_request
    end
  end

  private

  def load_user
    @candidates = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:name, :seat)
  end
end
