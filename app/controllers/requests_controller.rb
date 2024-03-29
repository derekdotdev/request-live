class RequestsController < ApplicationController
  load_and_authorize_resource

  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.json { render json: { request: Request.last, request_count: @requests.count }}
    end

    authorize! :index, @requests
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
    titles = ['What would you like to hear?', 'What are you in the mood to listen to?', 'Request a song!']
    @title  = titles.sample
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to thank_you_path, flash_success('created') }
        format.json { render :show, status: :created, location: @request }
      else
        # format.html { redirect_to new_request_path }
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to thank_you_path, flash_success('updated') }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, flash_success('destroyed')}
      format.json { head :no_content }
    end
  end

  def thank_you
  end

  private
    def flash_success(action)
      { flash: { success: "Request was successfully #{action}." } }
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:artist, :title, :comments).merge(user_id: current_user.id)
    end
end
