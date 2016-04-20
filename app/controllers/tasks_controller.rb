class TasksController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :edit]
	before_action :correct_user,   only: [:destroy, :edit]

	def index
		if logged_in?
		  	@task = current_user.tasks.build if logged_in?
		  	@task_items = current_user.feed.paginate(page: params[:page], :per_page => 10)
		  	if params[:search]
				@task_items = current_user.tasks.search(params[:search]).order("created_at DESC").paginate(page: params[:page], :per_page => 10)
			else
				@task_items = current_user.tasks.all.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
			end
		end
	end

	def create
		@task = current_user.tasks.build(task_params)
		respond_to do |format|
			if @result = @task.save
				format.html { redirect_to root_url }
				format.js { flash.now[:success] = "Task Created" } # render tasks/create.js.erb
			else
				@task_items = []
				format.html { render :action => "new" }
				format.js
			end
		end
	end

	def destroy
		@task.destroy
	    flash[:success] = "Task deleted"
	    redirect_to request.referrer || root_url
	end

	def search
		
	end

	def edit
		@task = current_user.tasks.find(params[:id])
		# respond_to do |format|
			# format.html
			# format.js
		# end
	end

	def update
		@task = current_user.tasks.find(params[:id])
		respond_to do |format|
		    if @result = @task.update_attributes(task_params)
		    	format.js { flash.now[:success] = "Task updated" }
		    	format.html { redirect_to root_url }
				# flash[:success] = "Task updated"
				# redirect_to root_url
		    else
		    	format.html { render 'edit' }
		    	format.js
				# render 'edit'
			end
		end
	end

	private

	    def task_params
	      params.require(:task).permit(:title, :description, :start, :finish)
	    end

	    def correct_user
			@task = current_user.tasks.find_by(id: params[:id])
			redirect_to root_url if @task.nil?
		end
end
