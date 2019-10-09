class StudentsController < ApplicationController

    before_action :find_student, only: [:show, :edit, :update, :destroy]

    def index
        @students = Student.all
    end

    def show
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(allowed_params)
        if @student.valid?
            @student.save
            redirect_to student_path(@student)
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        @student = Student.update(allowed_params)
        redirect_to student_path(@student)
    end

    def destroy
        @student.destroy
        redirect_to students_path
    end

    private
    def allowed_params
        params.require(:student).permit(:first_name, :last_name, :age, :school_id)
    end

    def find_student
        @student = Student.find(params[:id])
    end

end