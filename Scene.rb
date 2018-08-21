class Scene 
	@@current = nil 
	@@scene_directors = {}

	def self.add(director_name,director_obj)
		@@scene_directors[director_name.to_sym] = director_obj
	end

	def self.current=(director_name)
		@@current = director_name.to_sym 
	end

	def self.play
		@@scene_directors[@@current].play
	end
end
