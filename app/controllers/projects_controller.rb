class ProjectsController < ApplicationController
	def index
		list
		render('list')
	end

	def list
		@projects = Project.order("projects.created_at ASC")
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(params[:project])
		if @project.save
			flash[:notice] = "Photo created."
			redirect_to(:action=>'list')
		else
			render('new')
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(params[:project])
			redirect_to(:action=>'show',:id=>@project.id)
		else
			render('edit')
		end
	end

	def delete
		@project = Project.find(params[:id])
	end

	def destroy
		Project.find(params[:id]).destroy
		redirect_to(:action=>'list')
	end

end
