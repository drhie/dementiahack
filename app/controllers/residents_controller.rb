class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update, :new_profile, :create_profile, :new_availability, :create_availability, :destroy]

  # GET /residents/1
  # GET /residents/1.json
  def show
  end

  # GET /residents/new
  def new
    @resident = Resident.new
  end

  # GET /residents/1/edit
  def edit
  end

  # POST /residents
  # POST /residents.json
  def create
    @resident = Resident.new(resident_params)

    respond_to do |format|
      if @resident.save
        session[:user_id] = @resident.id
        session[:type] = @resident.class.name
        format.html { redirect_to @resident, notice: 'Resident was successfully created.' }
        format.json { render :show, status: :created, location: @resident }
      else
        format.html { render :new }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residents/1
  # PATCH/PUT /residents/1.json
  def update
    respond_to do |format|
      if @resident.update(resident_params)
        format.html { redirect_to @resident, notice: 'Resident was successfully updated.' }
        format.json { render :show, status: :ok, location: @resident }
      else
        format.html { render :edit }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_profile
    @hobbies = Hobby.setlist
    @interaction = Interaction.setlist
    @language = Language.setlist
    @school = Schooling.setlist_names
    @level = Schooling.setlist_levels
    @specialization = Schooling.setlist_specializations
    @industry = WorkExperience.setlist
    @cultural_background = CulturalBackground.setlist
    @availability = Availability.setlist
    @age_ranges = ['Under 18', '18-24', '25-29', '30-34', '35-39', '40-44', '45-49', '50-54', '55-59', '60-64', '65-69', '70+']

    @resident.hobbies.build if !@resident.hobbies.any?
    @resident.languages.build if !@resident.languages.any?
    @resident.cultural_backgrounds.build if !@resident.cultural_backgrounds.any?
    @resident.interactions.build if !@resident.interactions.any?
    @resident.schoolings.build if !@resident.schoolings.any?
    @resident.skills.build if !@resident.skills.any?
    @resident.work_experiences.build if !@resident.work_experiences.any?
  end

  def create_profile
    respond_to do |format|
      if @resident.update(resident_params)
        format.html { redirect_to @resident, notice: 'Resident was successfully updated.' }
        format.json { render :show, status: :ok, location: @resident }
      else
        format.html { render :edit }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  def check_availabilities
    Availability.check_availabilities(@resident)
  end

  def new_availability
  end

  def create_availability
    availabilities = params['availability']['timeslot']
    availabilities.each do |availability|
      Availability.create(timeslot: availability, resident_id: @resident.id)
    end
    redirect_to resident_path(@resident)
  end

  # DELETE /residents/1
  # DELETE /residents/1.json
  def destroy
    @resident.destroy
    respond_to do |format|
      format.html { redirect_to residents_url, notice: 'Resident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resident
      @resident = Resident.find(session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resident_params
      params.require(:resident).permit(:first_name, :last_name, :email, :to_teach, :age, :active, :neighborhood, :city, :location, :avatar, :password, :password_confirmation,
      hobbies_attributes: [ :id, :name, :_destroy ],
      languages_attributes: [ :id, :language, :_destroy ],
      cultural_backgrounds_attributes: [ :id, :background, :_destroy],
      interactions_attributes: [ :id, :interaction, :_destroy ],
      schoolings_attributes: [ :id, :name, :level, :specialization, :_destroy ],
      skills_attributes: [ :id, :name, :_destroy ],
      work_experiences_attributes: [ :id, :industry,  :_destroy ])
    end
end
