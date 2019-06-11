class NewEventsController < ApplicationController
  include MyUtility
  before_action :set_new_event, only: [:show, :edit, :update, :destroy]

  # GET /new_events
  def index
    placeholder_set
    param_set
    @count	= NewEvent.notnil().includes(:event, :flag).search(params[:q]).result.hit_count()
    @search	= NewEvent.notnil().includes(:event, :flag).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @new_events	= @search.result.per(50)
  end

  def param_set
    @form_params = {}

    @latest_result = Name.maximum("result_no")

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf("%d",@latest_result)
    end

    params_to_form(params, @form_params, column_name: "pc_name_name", params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "generate_no", params_name: "generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "event_name", params_name: "event_form", type: "text")
    params_to_form(params, @form_params, column_name: "flag_name", params_name: "flag_form", type: "text")

    is_sub_hash =  {"is_main"=> @form_params["is_main"],"is_sub" => @form_params["is_sub"]}
    sub_no_set(params, is_sub_hash)
    @form_params["is_main"] = is_sub_hash["is_main"]
    @form_params["is_sub"] = is_sub_hash["is_sub"]
  end
  # GET /new_events/1
  #def show
  #end

  # GET /new_events/new
  #def new
  #  @new_event = NewEvent.new
  #end

  # GET /new_events/1/edit
  #def edit
  #end

  # POST /new_events
  #def create
  #  @new_event = NewEvent.new(new_event_params)

  #  if @new_event.save
  #    redirect_to @new_event, notice: "New event was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /new_events/1
  #def update
  #  if @new_event.update(new_event_params)
  #    redirect_to @new_event, notice: "New event was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /new_events/1
  #def destroy
  #  @new_event.destroy
  #  redirect_to new_events_url, notice: "New event was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_event
      @new_event = NewEvent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def new_event_params
      params.require(:new_event).permit(:result_no, :generate_no, :event_id, :flag_id)
    end
end
