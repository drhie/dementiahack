class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update, :new_profile, :create_profile, :new_availability, :create_availability, :destroy]

  # GET /volunteers
  # GET /volunteers.json
  def index
    @volunteers = Volunteer.all
  end

  # GET /volunteers/1
  # GET /volunteers/1.json
  def show
  end

  # GET /volunteers/new
  def new
    @volunteer = Volunteer.new
  end

  # GET /volunteers/1/edit
  def edit
  end

  # POST /volunteers
  # POST /volunteers.json
  def create
    @volunteer = Volunteer.new(volunteer_params)

    respond_to do |format|
      if @volunteer.save
        session[:user_id] = @volunteer.id
        session[:type] = @volunteer.class.name
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully created.' }
        format.json { render :show, status: :created, location: @volunteer }
      else
        format.html { render :new }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volunteers/1
  # PATCH/PUT /volunteers/1.json
  def update
    respond_to do |format|
      if @volunteer.update(volunteer_params)
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully updated.' }
        format.json { render :show, status: :ok, location: @volunteer }
      else
        byebug
        format.html { render :edit }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
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
    @age_ranges = ['Under 18', '18-24', '25-29', '30-34', '35-39', '40-44', '45-49', '50-54', '55-59', '60-64', '65-69', '70+']
    @volunteer.hobbies.build
    @volunteer.languages.build
    @volunteer.cultural_backgrounds.build
    @volunteer.interactions.build
    @volunteer.schoolings.build
    @volunteer.skills.build
    @volunteer.work_experiences.build
  end

  def create_profile
    respond_to do |format|
      if @volunteer.update(volunteer_params)
        format.html { redirect_to @volunteer }
        format.json { render :show, status: :ok, location: @volunteer }
      else
        format.html { render :edit }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteers/1
  # DELETE /volunteers/1.json
  def destroy
    @volunteer.destroy
    respond_to do |format|
      format.html { redirect_to volunteers_url }
      format.json { head :no_content }
    end
  end

  def check_availabilities
    Availability.check_availabilities(@volunteer)
  end

  def new_availability
  end

  def create_availability
    availabilities = params['availability']['timeslot']
    availabilities.each do |availability|
      Availability.create(timeslot: availability, volunteer_id: @volunteer.id)
    end
    redirect_to volunteer_path(@volunteer)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer
      @volunteer = Volunteer.find(session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_params
      params.require(:volunteer).permit(:first_name, :last_name, :email, :to_learn, :neighborhood, :city, :password, :password_confirmation,
      hobbies_attributes: [ :id, :name, :_destroy ],
      languages_attributes: [ :id, :language, :_destroy ],
      cultural_backgrounds_attributes: [ :id, :background, :_destroy],
      interactions_attributes: [ :id, :interaction, :_destroy ],
      schoolings_attributes: [ :id, :name, :level, :specialization, :_destroy ],
      skills_attributes: [ :id, :name, :_destroy ],
      work_experiences_attributes: [ :id, :industry,  :_destroy ])
    end
end
