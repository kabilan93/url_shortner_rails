class LinksController < ApplicationController
    def index
        @links = Link.all()
    end

    def show
        if Link.exists?(params[:id])
            @link = Link.find(params[:id]) 
        else
            render :errors
        end
    end

    def new
        @link = Link.new()
    end

    def create
        @link = Link.new(link_params)
        if @link.save
          redirect_to @link
        else
          render :new
        end
    end
    
    def go
        link = Link.find_by(slug: params[:slug])
        if link
            link.increment!(:clicked)
            redirect_to link.url
        else
            render 'errors', status:404
        end    
    end

    private

    def link_params
        params.require(:link).permit(:url)
    end
end
