class StudentsController < ApplicationController
  before_action :skip_pundit?, only: [:index, :show]

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    authorize @student
  end
end
