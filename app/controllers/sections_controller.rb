class SectionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@sections = Section.all
	end

	def new
        @section = Section.new
	end

    def edit
        @section = Section.find(params[:id])
    end

    def show
        @section = Section.find(params[:id])
    end

	def create
        @section = Section.new(section_params)

        respond_to do |format|
            if @section.save
                flash[:notice] = 'Section was successfully created.'
                format.html { redirect_to(:controller => 'sections', :action => 'index' )}
            else
                format.html { render :action => "new" }
                format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
            end
        end
	end

    def update
        @section = Section.find(params[:id])

            respond_to do |format|
            if @section.update_attributes(section_params)
                format.html { redirect_to(@section, :notice => 'Section was successfully updated.') }
                format.xml  { head :ok }
            else
                format.html { render :action => "edit" }
                format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
            end
        end
    end

    def destroy
        @section = Section.find(params[:id])
        @section.destroy

        redirect_to sections_path
    end

    private

    def section_params
        params.require(:section).permit(:title, :content)
    end
end
