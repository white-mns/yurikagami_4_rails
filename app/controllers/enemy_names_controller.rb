class EnemyNamesController < ApplicationController
  include MyUtility
  before_action :set_enemy_name, only: [:show, :edit, :update, :destroy]

  # GET /enemy_names
  def index
    param_set
    @count	= EnemyName.includes([:p_name]).search(params[:q]).result.count()
    @search	= EnemyName.includes([:p_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @enemy_names	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
        reference_number_assign(params, "enemy_id", "enemy_id_form")
        reference_number_assign(params, "name", "name_form")
        
    @p_name_form = params["p_name_form"]
        @enemy_id_form = params["enemy_id_form"]
        @name_form = params["name_form"]
        
    show_sub_hash =  {"show_main"=> @show_main,"show_sub" => @show_sub}
    sub_no_set(params, show_sub_hash)
    @show_main = show_sub_hash["show_main"]
    @show_sub = show_sub_hash["show_sub"]
  end
  # GET /enemy_names/1
  #def show
  #end

  # GET /enemy_names/new
  #def new
  #  @enemy_name = EnemyName.new
  #end

  # GET /enemy_names/1/edit
  #def edit
  #end

  # POST /enemy_names
  #def create
  #  @enemy_name = EnemyName.new(enemy_name_params)

  #  if @enemy_name.save
  #    redirect_to @enemy_name, notice: 'Enemy name was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /enemy_names/1
  #def update
  #  if @enemy_name.update(enemy_name_params)
  #    redirect_to @enemy_name, notice: 'Enemy name was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /enemy_names/1
  #def destroy
  #  @enemy_name.destroy
  #  redirect_to enemy_names_url, notice: 'Enemy name was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enemy_name
      @enemy_name = EnemyName.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def enemy_name_params
      params.require(:enemy_name).permit(:enemy_id, :name)
    end
end
