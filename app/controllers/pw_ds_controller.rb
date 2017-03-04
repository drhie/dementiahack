class PwDsController < ApplicationController
  before_action :set_pwd, only: [:show, :edit, :update, :destroy]

  # GET /pwds
  # GET /pwds.json
  def index
    @pwds = Pwd.all
  end

  # GET /pwds/1
  # GET /pwds/1.json
  def show
  end

  # GET /pwds/new
  def new
    @pwd = Pwd.new
  end

  # GET /pwds/1/edit
  def edit
  end

  # POST /pwds
  # POST /pwds.json
  def create
    @pwd = Pwd.new(pwd_params)

    respond_to do |format|
      if @pwd.save
        format.html { redirect_to @pwd, notice: 'Pwd was successfully created.' }
        format.json { render :show, status: :created, location: @pwd }
      else
        format.html { render :new }
        format.json { render json: @pwd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pwds/1
  # PATCH/PUT /pwds/1.json
  def update
    respond_to do |format|
      if @pwd.update(pwd_params)
        format.html { redirect_to @pwd, notice: 'Pwd was successfully updated.' }
        format.json { render :show, status: :ok, location: @pwd }
      else
        format.html { render :edit }
        format.json { render json: @pwd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pwds/1
  # DELETE /pwds/1.json
  def destroy
    @pwd.destroy
    respond_to do |format|
      format.html { redirect_to pwds_url, notice: 'Pwd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pwd
      @pwd = Pwd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pwd_params
      params.fetch(:pwd, {})
    end
end
