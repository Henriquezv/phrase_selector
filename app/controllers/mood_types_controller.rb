class MoodTypesController < ApplicationController
  before_action :set_mood_type, only: %i[ show edit update destroy ]

  # GET /mood_types or /mood_types.json
  def index
    @mood_types = MoodType.all
  end

  # GET /mood_types/1 or /mood_types/1.json
  def show
  end

  # GET /mood_types/new
  def new
    @mood_type = MoodType.new
  end

  # GET /mood_types/1/edit
  def edit
  end

  # POST /mood_types or /mood_types.json
  def create
    @mood_type = MoodType.new(mood_type_params)

    respond_to do |format|
      if @mood_type.save
        format.html { redirect_to mood_type_url(@mood_type), notice: "Mood type was successfully created." }
        format.json { render :show, status: :created, location: @mood_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mood_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mood_types/1 or /mood_types/1.json
  def update
    respond_to do |format|
      if @mood_type.update(mood_type_params)
        format.html { redirect_to mood_type_url(@mood_type), notice: "Mood type was successfully updated." }
        format.json { render :show, status: :ok, location: @mood_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mood_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mood_types/1 or /mood_types/1.json
  def destroy
    @mood_type.destroy

    respond_to do |format|
      format.html { redirect_to mood_types_url, notice: "Mood type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mood_type
      @mood_type = MoodType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mood_type_params
      params.require(:mood_type).permit(:description)
    end
end
