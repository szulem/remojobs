class SimpleClass 
	attr_accessor :message 

	def initialize() 
		puts "\nCreating a new instance of the SimpleClass class" 
		@message = 'howdy' 
	end 

	def update_message(new_message) 
		@message = new_message 
	end 
end