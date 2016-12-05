class Book < ApplicationRecord
	
	
	has_many :authors
	has_one :publisher
	has_one :subject

	mount_uploader :picture, BookUploader
end
