class MicropostsController < ApplicationController
  before_filter :authenticate

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Transaction created!"

      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end

    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
  end

end
