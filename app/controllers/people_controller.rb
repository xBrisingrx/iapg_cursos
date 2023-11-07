class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy modal_disable disable ]
  before_action :get_cities, only: %i[ new edit ]

  # GET /people or /people.json
  def index
    @q = Person.ransack(params[:q])
    @pagy, @people = pagy( @q.result )
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  def list;end

  # GET /people/1/edit
  def edit;end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        flash.now[:notice] = "Persona registrada."
        format.turbo_stream { 
          render turbo_stream: [
            turbo_stream.prepend("people_table_body", partial: "people/person", locals: { person: @person }),
            turbo_stream.replace("notifications", partial: "shared/notifications")
          ]
        }
        format.html { redirect_to person_url(@person), notice: "Persona registrada." }
        format.json { render :show, status: :created, location: @person }
      else
        @cities = City.all.includes(:province)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        flash.now[:notice] = "Los datos de la persona fueron actualizados."
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.replace( @person ),
            turbo_stream.replace("notifications", partial: "shared/notifications")
          ]
        }
        format.html { redirect_to person_url(@person), notice: "Los datos de la persona fueron actualizados." }
        format.json { render :show, status: :ok, location: @person }
      else
        @cities = City.all.includes(:province)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def modal_disable;end

  def disable
    if @person.disable
      flash.now[:notice] = "Se deshabilito a #{@person.fullname} con éxito."
        render turbo_stream: [
          turbo_stream.remove( @person ),
          turbo_stream.replace("notifications", partial: "shared/notifications")
        ]
    else
      flash.now[:alert] = "No se pudo deshabilitar a #{@person.fullname}."
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy!

    respond_to do |format|
      flash.now[:notice] = "Se elimino a #{@person.fullname} con éxito."
      format.turbo_stream {
        render turbo_stream: [
          turbo_stream.remove( @person ),
            turbo_stream.replace("notifications", partial: "shared/notifications")
        ]
      }
      format.html { redirect_to people_url, notice: "Se elimino a #{@person.fullname} con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    def get_cities
      @cities = City.all.includes(:province)
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:cuil, :last_name, :name, :birthdate, :phone, :celphone, :email, :direction, :code, :province_id, :city_id, :active)
    end
end
