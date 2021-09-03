class StudentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :skip_policy_scope, only: :index
  before_action :skip_authorization, only: :show

  def index
    if params[:starts_at].present? && params[:ends_at].present?
      @students = Student.available(params[:starts_at], params[:ends_at])
    else
      @students = Student.all
      @markers = @students.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
      end
    end
  end

  def show
    @student = Student.find(params[:id])
  end
end
