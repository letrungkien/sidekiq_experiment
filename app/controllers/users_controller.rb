class UsersController < ApplicationController
  before_action :load_instance, only: :show

  def show
  end

  private
  def load_instance
    @user = User.find params[:id]
  end
end