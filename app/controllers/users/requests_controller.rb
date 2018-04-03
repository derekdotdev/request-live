class Users::RequestsController < ApplicationController
  def index
    @requests = Request.where(user_id: current_user.id)
  end
end
