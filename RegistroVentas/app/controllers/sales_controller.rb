class SalesController < ApplicationController


  def new

    @sale = Sale.new
  end

  def create
   
    
    @sale = Sale.new(sale_params)
    # value = params[:value].to_i
    # discount = params[:discount].to_i
    # execto = params[:checkedIva].to_i
  

    # value = (  value  -  (  value  * discount) /100)
  

    # if execto == 1
    #   tax = 19
    # else
    #   tax = 0
    # end
    # total = ( value - ( value * tax)/100 )
    # @sale.total = total
    
  

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
     params.permit(:cod,:detail,:category,:value,:discount,:checkedIva)

   end
end
