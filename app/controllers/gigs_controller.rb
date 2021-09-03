class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :edit, :update, :destroy]
  before_action :build_students_array, only: [:new, :create]
  # skip_before_action :authenticate_user!, only: :new

  def index
    @gigs = policy_scope(Gig)
  end

  # GET /gig/1
  def show
  end

  # GET /gigs/new
  def new
    @gig = Gig.new
    authorize @gig
  end

  # GET /gigs/1/edit
  def edit
  end

  # POST /gigs
  def create
    @gig = Gig.new(gig_params)
    @gig.user = current_user
    @gig.students = @students
    authorize @gig

    if @gig.save
      redirect_to gigs_path, notice: 'Gig was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gigs/1
  def update
    if @gig.update(gig_params)
      redirect_to gigs_path, notice: 'Gig was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gigs/1
  def destroy
    @gig.destroy
    redirect_to gigs_path, notice: 'Gig was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gig
    @gig = Gig.find(params[:id])
    authorize @gig
  end

  # Only allow a list of trusted parameters through.
  def gig_params
    params.require(:gig).permit(:name, :starts_at, :ends_at, :description)
  end

  def build_students_array
    # where method can directly match all instances of an array
    @students = Student.where(id: params[:student_id])
  end
end
