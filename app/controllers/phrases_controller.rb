class PhrasesController < ApplicationController
  before_action :set_phrase, only: %i[ show edit update destroy ]
  before_action :set_mood_type_options, only: [:new, :edit, :update, :create]

  # GET /phrases or /phrases.json
  def index
    @phrases = Phrase.all
  end

  # GET /phrases/1 or /phrases/1.json
  def show
  end

  # GET /phrases/new
  def new
    @phrase = Phrase.new
  end

  # GET /phrases/1/edit
  def edit
  end

  # POST /phrases or /phrases.json
  def create
    @phrase = Phrase.new(phrase_params)

    respond_to do |format|
      if @phrase.save
        format.html { redirect_to phrase_url(@phrase), notice: "Frase criada com sucesso." }
        format.json { render :show, status: :created, location: @phrase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phrases/1 or /phrases/1.json
  def update
    respond_to do |format|
      if @phrase.update(phrase_params)
        format.html { redirect_to phrase_url(@phrase), notice: "Frase atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @phrase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phrases/1 or /phrases/1.json
  def destroy
    @phrase.destroy

    respond_to do |format|
      format.html { redirect_to phrases_url, notice: "Frase apagada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    def set_mood_type_options
      @mood_type_options = MoodType.all.pluck(:description, :id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_phrase
      @phrase = Phrase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phrase_params
      params.require(:phrase).permit(:text, :mood_type_id)
    end
end
