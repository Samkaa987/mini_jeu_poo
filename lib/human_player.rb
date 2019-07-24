require 'pry'
require 'time'
require_relative 'player'
class HumanPlayer < Player
	attr_accessor :name , :life_points , :weapon_level
	@@all_human_players = []

	def initialize(name)					# méthode initialize, on rentre la variable name en entrée, et on définit les attributs.
		@name = name.to_s
		@life_points = 100
		@weapon_level = 1
		@@all_human_players << self
		@@all_players << self
	end

	def show_state							# montre les points de vie restants et le niveau d'armement d'un joueur.
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}.".center(215)
	end

	def compute_damage
    	rand(1..6) * @weapon_level
  	end

  	def search_weapon
  		result = rand(1..6)
  		puts "Tu cherches une nouvelle arme : [ENTER]".center(215)
  		gets.chomp
  		puts "Tu viens de trouver une arme de niveau #{result} !".center(215)
  		if result > @weapon_level
  			@weapon_level = result
  			puts "Cette arme est meilleure que la tienne, tu la prends !".center(215)
  		else puts "Cette arme est nulle, tu ne la prends pas...".center(215)
  		end	
  	end

  	def search_health_pack
  		puts "Tu cherches un pack de points de vie : [ENTER]".center(215)
  		gets.chomp
  		result = rand(1..6)
  		if result == 1
  			puts "tu n'as rien trouvé...".center(215)
  		elsif result == 6 
  			@life_points = @life_points + 80
  			if @life_points > 100
  				@life_points = 100
  			end
  			puts "Waow, tu as trouvé un pack de +80 points de vie !".center(215)
  		else @life_points = @life_points + 50
  			if @life_points > 100
  				@life_points = 100
  			end
  			puts "Bravo, tu as trouvé un pack de +50 points de vie !".center(215)
  		end	
  	end

end