class PullRequestsController < ApplicationController
  before_action :set_pull_request, only: %i[ show edit update destroy ]

  # GET /pull_requests or /pull_requests.json
  def index
    @sort = params[:sort] || :merged_at
    @order = params[:order] || :asc

    @pull_requests = PullRequest.unscoped.order(@sort => @order)
  end

  # GET /pull_requests/1 or /pull_requests/1.json
  def show
  end

  # GET /pull_requests/new
  def new
    @pull_request = PullRequest.new
  end

  # GET /pull_requests/1/edit
  def edit
  end

  # POST /pull_requests or /pull_requests.json
  def create
    @pull_request = PullRequest.new(pull_request_params)

    respond_to do |format|
      if @pull_request.save
        format.html { redirect_to pull_request_url(@pull_request), notice: "Pull request was successfully created." }
        format.json { render :show, status: :created, location: @pull_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pull_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pull_requests/1 or /pull_requests/1.json
  def update
    respond_to do |format|
      if @pull_request.update(pull_request_params)
        format.html { redirect_to pull_request_url(@pull_request), notice: "Pull request was successfully updated." }
        format.json { render :show, status: :ok, location: @pull_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pull_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pull_requests/1 or /pull_requests/1.json
  def destroy
    @pull_request.destroy!

    respond_to do |format|
      format.html { redirect_to pull_requests_url, notice: "Pull request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pull_request
      @pull_request = PullRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pull_request_params
      params.require(:pull_request).permit(:num, :url, :title, :repository, :notes, :category_id, :merged_at, :test_priority)
    end
end
