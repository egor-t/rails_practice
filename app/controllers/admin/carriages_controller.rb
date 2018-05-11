class Admin::CarriagesController < Admin::BaseController
  before_action :set_train, only: [:new, :create]
  before_action :set_carriage, only: [:edit, :update, :show, :destroy]

   def index
     @carriages = Carriage.all
   end

   def new
     @carriage = Carriage.new
   end

   def create
     @carriage = @train.carriages.new(carriage_params)
     if @carriage.save
       redirect_to @train, note: 'Carriage added!'
     else
       render 'new'
     end
   end

   def edit
   end

   def update
     if @carriage.update(carriage_params)
       redirect_to @carriage
     else
       render 'edit'
     end
   end

   def show
   end

   def destroy
     @carriage.destroy
     redirect_to carriages_url
   end

   private

   def set_train
     @train = Train.find(params[:train_id])
   end

   def set_carriage
     @carriage = Carriage.find(params[:id])
   end

   def carriage_params
     params.require(:carriage).permit(:top_seats, :bottom_seats, :train_id)
   end
end
