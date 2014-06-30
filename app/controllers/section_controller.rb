class SectionController < ApplicationController

	def index
	end

	def new
        @section = Section.new
	end

	def create
        @section = Section.new(params[:section])

        respond_to do |format|
            if @section.save
                flash[:notice] = 'Section was successfully created.'
                format.html { redirect_to(:controller => 'section', :action => 'index' )}
            else
                format.html { render :action => "new" }
                format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
            end
        end
	end

end
