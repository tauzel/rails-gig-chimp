class GigsController < ApplicationController
  # def index
  #   @gigs = policy_scope(Gig)
  # end

  # GET /gig/1
  def show
    @gig = Gig.find(params[:id])
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

    if @gig.save
      redirect_to @gig, notice: 'Gig was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gigs/1
  def update
    if @gig.update(gig_params)
      redirect_to @gig, notice: 'Gig was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gigs/1
  def destroy
    @gig.destroy
    redirect_to gigs_url, notice: 'Gig was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_gig
    @gig = Gig.find(params[:id])
    authorize @gig
  end

    # Only allow a list of trusted parameters through.
  def gig_params
    params.require(:gigs).permit(:name, :start, :end, :description)
  end
end
