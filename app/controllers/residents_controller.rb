class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update, :new_profile, :create_profile, :new_availability, :create_availability, :destroy]

  # GET /residents
  # GET /residents.json
  def index
    @residents = Resident.all
  end

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
    @hobbies = ["Cards", "Squash", "Ping Pong", "Dance", "Drawing", "Fantasy Sports", "Knitting", "Puzzles", "Pottery", "Yoga"]
    @interaction = ["Individual", "Small Group", "Large Group"]
    @language = ['English', 'Hindi', 'Korean', 'Japanese', 'German', 'Chinese', 'Spanish', 'French', "Portugese", "Bengali", "Russian", "Swedish"]
    @school = ["University of Toronto", "University of Waterloo", "University of Windsor", "George Brown College", "McMaster University", "Laurentian University", "OCAD University", "Queen's University", "Ryerson University", "Trent University", "University of Guelph", "University of Ontario Institute of Technology", "University of Ottawa", "Wilfrid Laurier University", "York University"]
    @level = ["High School", "Postsecondary", "Graduate", "Doctorate", "Undergrad"]
    @specialization = ["Genetics", "Commerce", "International Relations", "Computer Science"]
    @industry = ["Retail", "Research", "Translation", "IT", "Accountant", "Charity and Voluntary Work", "Business Consulting", "Banking", "Computer Networking", "Broadcast Media", "Education", "Entertainment", "Farming", "Judiciary", "Insurance", "Graphic Design", "Hospitality", "Insurance", "Trade"]
    @cultural_background = ['German', 'Indian', 'Korean', 'Chinese']
    @availability = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Breakfast', 'Lunch', 'Evening', 'Morning', 'Afternoon', 'Evening']
    @resident.languages.build
    @resident.cultural_backgrounds.build
    @resident.interactions.build
    @resident.schoolings.build
    @resident.skills.build
    @resident.work_experiences.build
  end

  def create_profile
    respond_to do |format|
      if @resident.update(resident_params)
        format.html { redirect_to @resident, notice: 'Volunteer was successfully updated.' }
        format.json { render :show, status: :ok, location: @resident }
      else
        byebug
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
      params.require(:resident).permit(:first_name, :last_name, :email, :to_teach, :age, :active, :neighborhood, :city, :password, :password_confirmation,
      hobbies_attributes: [ :id, :name, :_destroy ],
      languages_attributes: [ :id, :language, :_destroy ],
      cultural_backgrounds_attributes: [ :id, :background, :_destroy],
      interactions_attributes: [ :id, :interaction, :_destroy ],
      schoolings_attributes: [ :id, :name, :level, :specialization, :_destroy ],
      skills_attributes: [ :id, :name, :_destroy ],
      work_experiences_attributes: [ :id, :industry,  :_destroy ])
    end
end
