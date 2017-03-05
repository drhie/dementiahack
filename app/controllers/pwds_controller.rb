class PwdsController < ApplicationController
  before_action :set_pwd, only: [:show, :edit, :update, :new_profile, :create_profile, :new_availability, :create_availability, :destroy]

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
        session[:user_id] = @pwd.id
        session[:type] = @pwd.class.name
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
    @pwd.languages.build
    @pwd.cultural_backgrounds.build
    @pwd.interactions.build
    @pwd.schoolings.build
    @pwd.skills.build
    @pwd.work_experiences.build
  end

  def create_profile
    respond_to do |format|
      if @pwd.update(pwd_params)
        format.html { redirect_to @pwd, notice: 'Volunteer was successfully updated.' }
        format.json { render :show, status: :ok, location: @pwd }
      else
        byebug
        format.html { render :edit }
        format.json { render json: @pwd.errors, status: :unprocessable_entity }
      end
    end
  end

  def check_availabilities
    Availability.check_availabilities(@pwd)
  end

  def new_availability
  end

  def create_availability
    availabilities = params['availability']['timeslot']
    availabilities.each do |availability|
      Availability.create(timeslot: availability, pwd_id: @pwd.id)
    end
    redirect_to pwd_path(@pwd)
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
      @pwd = Pwd.find(session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pwd_params
      params.require(:pwd).permit(:first_name, :last_name, :email, :to_teach, :age, :active, :neighborhood, :city, :password, :password_confirmation,
      hobbies_attributes: [ :id, :name, :_destroy ],
      languages_attributes: [ :id, :language, :_destroy ],
      cultural_backgrounds_attributes: [ :id, :background, :_destroy],
      interactions_attributes: [ :id, :interaction, :_destroy ],
      schoolings_attributes: [ :id, :name, :level, :specialization, :_destroy ],
      skills_attributes: [ :id, :name, :_destroy ],
      work_experiences_attributes: [ :id, :industry,  :_destroy ])
    end
end
