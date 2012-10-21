class UsersController < ApplicationController

  def show
    @user = User.find_by_nickname params[:nickname]


    respond_to do |format|
      format.html
    end
  end
end
