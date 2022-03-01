class Proposal < ActiveRecord::Base
    validates :name, presence: { message: "must have a name" }
	validates :description, presence: { message: "must have a description" }
    validates :value, presence: true , numericality: { greater_than: 0 }
    validates :start_date, presence: { message: "must have a start date" }, date: true
    validates :end_date, presence: { message: "must have a end date" }, date: { after: :start_date }

end

