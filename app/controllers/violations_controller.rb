class ViolationsController < ApplicationController
	def index
		# grab all the unqique categories names from the db
		categories = Violation.uniq.pluck(:category)

		cat_stats_array = []
		categories.each do |cat_name|
			# retrieve all violations that belong to that category
			violations = Violation.where({ category: cat_name})

			# grab the count, earliest, and latest date for that category
			count = violations.count
			earliest_date = violations.order('date ASC').first.date
			latest_date = violations.order('date DESC').first.date

			# store the info in a hash and pass to the array
			category_hash = {:name => cat_name, :count => count, :earliest_date => earliest_date.strftime("%B %e, %Y"), :latest_date => latest_date.strftime("%B %e, %Y")}
			cat_stats_array.push(category_hash)
		end

		# sort by largest amount of violations in a category
		@stats = cat_stats_array.sort_by { |hsh| hsh[:count] }.reverse
	end
end
