require 'open-uri'
require 'json'
require 'Nokogiri'

@buTeam = {}

# class Teammate
# 	attr_reader :imageurl, :name
# 	def initialize(name, imageurl=nil)
# 	  @name = name
# 	  @imageurl = imageurl
# 	end
# end

def loadBuPhotos
	doc = Nokogiri::HTML(open("http://www.brooklynunited.com/people"))
	people = doc.xpath("//div[@class='teammate']").to_a()
	people.each do |person|
		image = person.css(".teammate-picture").to_a()[0]['style'].split("'")[1]
		name = person.css("h5").to_a()[0].inner_text()
		@buTeam[name] = {name: name, image: image}
	end
	puts JSON.generate(@buTeam)
end
