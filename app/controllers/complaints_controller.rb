class ComplaintsController < ApplicationController
  before_action :load_complaint, only: [:show, :edit, :update, :destroy]

  def index
    @complaints = Complaint.all
  end

  def show
  end

  def new
    @complaint = Complaint.new
    @states = State.includes(:cities)
  end

  def edit
  end

  def create
    @complaint = Complaint.new(complaint_params)

    respond_to do |format|
      if @complaint.save
        format.html { redirect_to @complaint, notice: 'Complaint was successfully created.' }
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaint }
      else
        format.html { render :edit }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Complaint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def load_complaint
      @complaint = Complaint.find(params[:id])
    end

    def complaint_params
      params.require(:complaint).permit(:address, :cep, :state_id, :city_id, :picture)
    end
end
