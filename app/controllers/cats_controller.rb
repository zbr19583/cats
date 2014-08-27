class CatsController < ApplicationController
  def new
    @cat = Cat.new
    render :new
  end
  
  def index
    @cats = Cat.all
    render :index
  end
  
  def create
    @cat = Cat.new(cat_params)
    @cat.save
  end
  
  def show
    @cat = Cat.find(params[:id])
    render :show
  end
  
  def edit
    @cat = Cat.find(params[:id])
  end
  
  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      render :show
    else
      render json: @cat.errors.full_message, status: :unprocessable_entity
    end
  end
  
  def destroy
    cat = Cat.find(params[:id])
    cat.destroy
    
    redirect_to cats_path
  end
  
  private
  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :name, :sex, :description)
  end
end
