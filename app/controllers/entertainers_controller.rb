class EntertainersController < ApplicationController
  before_action :set_entertainer, only: [:show]

  # GET /entertainer/1
  # GET /entertainer/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: { entertainer: @entertainer }}
    end
  end

  private

  def set_entertainer
    @entertainer = User.find_by(name: params[:id])
  end
end
