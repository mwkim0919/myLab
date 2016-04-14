class StaticPagesController < ApplicationController
  def home
  	if logged_in?
	  	@task = current_user.tasks.build if logged_in?
	  	@task_items = current_user.feed.paginate(page: params[:page], :per_page => 10)
	end
  end

  def help
  end
end
