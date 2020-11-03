class EmployeesController < ApplicationController


    before_action :find_employee, only: [:show, :edit, :update, :destroy]

    def index
        @employees = Employee.all

    end

    def show   
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(employee_params)
        redirect_to employee_path(@employee)
    end

    def edit
         render new_employee_path
    end

    def update
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else 
            render edit_employee_path
        end
    end

    def destroy
        @employee.destroy
        redirect_to employees_path
    end

    private 

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end
end
