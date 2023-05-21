class EmployeesController < ApplicationController
	def index
		@employees = Employee.all		
	end

	def show
		@employee = Employee.find(params[:id])
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_parmas)		
		if @employee.save		  
			redirect_to employees_path
		else
			render 'new'
		end
	end

	private
	
	def employee_parmas
		params.require(:employee).permit(:name, :emp_id)
	end

end
