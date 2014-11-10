class BasicPagesController < ApplicationController
	def home
		@infotypes = Infotype.all
		@x = @c = @d = 0
        @y = @infotypes.size - 1
        @b = 1
        while @b <= @infotypes.size do
        @a = Info.where(:infotype_id => @b).count
        @d = @a && @c = @b if @a > @d
        @b = @b + 1
        end
        @infos = Info.search(params[:search])

	end

	def contact
	end

	def about
	end

	def help
	end
end
