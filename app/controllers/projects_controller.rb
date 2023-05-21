class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
		@employees = Employee.all
	end

	def edit
		@project = Project.find(params[:id])
	end

	def create
		@project = Project.new(project_parmas)
		if @project.save
		  params[:employee_ids].each do |emp_id|
		   	@employee = Employee.find(emp_id)
		   	@project.employees << @employee
		   end	
			redirect_to projects_path
		else
			render 'new'
		end
	end

	def update
		@project = Project.find(params[:id])
		if @project.update(project_parmas)
			@project.employees.destroy_all		
			params[:employee_ids].each do |emp_id|
			   	@employee = Employee.find(emp_id)
			   	@project.employees << @employee
			   end
			redirect_to projects_path	
		else
			render 'edit'
		end			
	end

private

	def project_parmas
		params.require(:project).permit(:title, employee_ids:[])
	end

end
