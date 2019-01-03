class SalesController < ApplicationController



  def done 
    @sale = Sale.all
  end
  def new

    @sale = Sale.new
  end

  def create
   
   
    @sale = Sale.new(sale_params)
    execto = @sale.tax
    
  
    @sale.value  = (  @sale.value  -  (  @sale.value  * @sale.discount) /100)
  
  # byebug
   if execto == 0
    @sale.tax = 0
   else
    @sale.tax = 19
     end
     @sale.total = ( @sale.value - ( @sale.value * @sale.tax)/100 )
    
    
  

    respond_to do |format|
      if @sale.save
        format.html { redirect_to sales_done_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end


   
   private def sale_params
     params.require(:sale).permit(:cod,:detail,:category,:value,:discount,:tax)

   end
end
