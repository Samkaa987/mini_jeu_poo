require 'pry'
require 'time'
class Player
	attr_accessor :name , :life_points		# les attributs de classes.
	@@all_ia_players = []
	@@all_players = []

	def initialize(name)					# méthode initialize, on rentre la variable name en entrée, et on définit les attributs.
		@name = name.to_s
		@life_points = 10
		@@all_ia_players << self
		@@all_players << self
	end

	def self.all 							# affiche tous les joueurs IA.
		return @@all_ia_players
	end

	def show_state							# montre les points de vie restants.
		puts "#{@name} a #{@life_points} points de vie."
	end

	def gets_damage(player, damage)			# définit la perte de points de vie, que l'on soustrait aux points de vie totaux.
		player.life_points = player.life_points - damage
		if player.life_points <= 0
			player.life_points = 0
			puts "Le joueur #{player.name} a été tué !"
		end
	end

	def attacks(player)						# définit l'action d'attaquer d'un joueur sur un autre.
		puts "Le joueur #{@name} attaque le joueur #{player.name}."
		damage = compute_damage
		puts "Il lui inflige #{damage} points de dégâts."
		gets_damage(player, damage)
	end

	def compute_damage						# définit un nombre de dommages au hasard.
		return rand(1..6)
	end

end