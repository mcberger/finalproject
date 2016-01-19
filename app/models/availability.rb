class Availability < ActiveRecord::Base
	belongs_to :user

	validates :date, uniqueness: true

	def start_time
        self.date.to_datetime ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end
end
