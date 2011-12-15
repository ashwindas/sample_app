class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
    @micropost = Micropost.new
    @feed_items = current_user.feed.paginate(:page => params[:page])
    @user = current_user
    end
  end

  def stats
    @title = "Statistics"
    if signed_in?
      @feed_items = current_user.feed
      @total = @feed_items.sum('expense')
      @user = current_user

      #Code below is for calculating information for the Pie chart
      tag_set = Set.new

      @feed_items.each do |m|
        tag_set << m.tag
      end

      @pie_data = Hash.new

      tag_set.each do |tag|
        temp_trans = @feed_items.where("tag = ?", tag)
        @pie_data[tag] = temp_trans.sum('expense')
      end

    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

end

