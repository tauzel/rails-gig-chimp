class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:starts_at].present? && params[:ends_at].present?
      @students = Student.available(params[:starts_at], params[:ends_at])
    else
      @students = Student.all
    end
  end
end
