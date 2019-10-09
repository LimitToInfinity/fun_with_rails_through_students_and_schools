class SchoolsController < ApplicationController

    before_action :find_school, only: [:show, :edit, :update, :destroy]

    def index
        @schools = School.all
    end

    def show
    end

    def new
        @school = School.new
    end

    def create
        @school = School.new(allowed_params)
        if @school.valid?
            @school.save
            redirect_to school_path(@school)
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        @school = School.update(allowed_params)
        redirect_to school_path(@school)
    end

    def destroy
        @school.destroy
        redirect_to schools_path
    end

    private
    def allowed_params
        params.require(:school).permit(:name, :number_of_teachers)
    end

    def find_school
        @school = School.find(params[:id])
    end

end