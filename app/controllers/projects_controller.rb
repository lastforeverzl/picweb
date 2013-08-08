class ProjectsController < ApplicationController

	# before_filter :confirmed_logged_in
	before_filter :signed_in_user

	def index
		@projects = Project.order("projects.created_at DESC")
	end

	def new
		@project = Project.new
	end

	def show
		@project = Project.find(params[:id])
	end

	def create
		@project = Project.new(params[:project])
		if @project.save
			flash[:notice] = "Photo created."
			redirect_to @project
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

	# def delete
	# 	@project = Project.find(params[:id])
	# end

	def destroy
		Project.find(params[:id]).destroy
		redirect_to(:action=>'index')
	end


end
