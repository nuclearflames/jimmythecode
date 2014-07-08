class HomeController < ApplicationController
	def index
		@sections = Section.order(:title)
	end
end
