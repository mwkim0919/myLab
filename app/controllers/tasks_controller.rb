class TasksController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :edit]
	before_action :correct_user,   only: [:destroy, :edit]

	def create
		@task = current_user.tasks.build(task_params)
		respond_to do |format|
			if @result = @task.save
				format.html { redirect_to root_url }
				format.js { flash.now[:success] = "Task Created" } # render tasks/create.js.erb
			else
				@task_items = []
				format.html { render :action => "new" }
				format.js { task = @task.title }
			end
		end
	end

	def destroy
		@task.destroy
	    flash[:success] = "Task deleted"
	    redirect_to request.referrer || root_url
	end

	def edit
	end

	private

	    def task_params
	      params.require(:task).permit(:title)
	    end

	    def correct_user
			@task = current_user.tasks.find_by(id: params[:id])
			redirect_to root_url if @task.nil?
		end
end
