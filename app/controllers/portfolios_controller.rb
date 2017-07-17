class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :edit, :update]}, site_admin: :all
  layout "portfolio"
  
    def index
        @portfolio_items = Portfolio.all
    end
  
    def angular
      @angular_portfolio_items = Portfolio.angular
    end
    
    def new
      @portfolio_item = Portfolio.new
      3.times { @portfolio_item.technologies.build } 
    end
    
    def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio Item is now live' }
      else
        format.html { render :new }
      end
    end
  end   

    def edit
    end

    def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

    def show
    end

    def destroy
    #Destroy record
    @portfolio_item.destroy
      
    #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was Successfully Removed' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                      )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
