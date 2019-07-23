require 'pry'
require 'time'
require_relative 'player'
require_relative 'human_player'
class Game
	attr_accessor :human_player , :ennemies_in_sight , :players_left
	@@rl = "ABCDEFGHIJKLMNOPQRSTUVWXYZazertyuiopqsdfghjklmwxcvbn0123456789".chars.to_a


	#Initilisation de la partie
	def initialize(name)
		@players_left = 10
		@human_player = HumanPlayer.new(name)
		@ennemies_in_sight = []
=begin		4.times do 
			@ennemies_in_sight << Player.new("player_#{@@rl.sample}")
		end
=end 
	end


	#vérifie si la partie est terminée ou non
	def kill_player(player)
		@ennemies_in_sight.delete(player)	
		@players_left -= 1
	end


	#vérifie si la partie est terminée ou non
	def is_still_ongoing?
		if human_player.life_points > 0 && @players_left > 0
			return true
		else return false
		end
	end


	#Affiche le status du héros et le nombre d'ennemis restants
	def show_players
		puts "======================================"
		puts "Voici ton état :"
		puts @human_player.show_state
		puts "il te reste encore #{@ennemies_in_sight.size} ennemis en vue et #{@players_left} ennemis à vaincre."
		puts "======================================"	
	end


	#Affiche le menu
	def menu
		puts "--------------------------------------"
		puts " "
		puts "Quelle action veux-tu effectuer ?"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner" 
		puts " "
		puts "attaquer un joueur en vue :"
		0.upto(@ennemies_in_sight.size - 1) do |index|
      	print "#{index} - "
      	@ennemies_in_sight[index].show_state #Affichage du status de l'ennemi
      	end
		puts " "
		puts "--------------------------------------"	
	end


	#Traitement de l'action choisie dans le menu
	def menu_choice
		print ">"
		result = gets.chomp.to_s
		if result == "a" || result == "A"
			@human_player.search_weapon
		elsif result == "s" || result == "S"
			@human_player.search_health_pack
		elsif result == "0"
			@human_player.attacks(@ennemies_in_sight[0])
			if @ennemies_in_sight[0].life_points <= 0
				kill_player(@ennemies_in_sight[0])
			end
		elsif result == "1"
			@human_player.attacks(@ennemies_in_sight[1])
			if @ennemies_in_sight[1].life_points <= 0
				kill_player(@ennemies_in_sight[1])
			end
		elsif result == "2"
			@human_player.attacks(@ennemies_in_sight[2])
			if @ennemies_in_sight[2].life_points <= 0
				kill_player(@ennemies_in_sight[2])
			end
		elsif result == "3"
			@human_player.attacks(@ennemies_in_sight[3])
			if @ennemies_in_sight[3].life_points <= 0
				kill_player(@ennemies_in_sight[3])
			end
		else puts "Tu n'as pas choisi d'action à effectuer, dommage.."
		end
		puts " "
		puts "RÉSULTAT DE CE TOUR D'ATTAQUE POUR #{@human_player.name} :"
		print @human_player.show_state
		@ennemies_in_sight.each do |n|
			print n.show_state
		end
		puts " "
		puts "--------------------------------------"
		puts "Maintenant, c'est au tour des autres joueurs de t'attaquer !"
		puts "Appuyez sur [ENTER]"
		print ">"
		puts gets.chomp	
	end


	#Gestion de la phase d'attaque des ennemis
	def ennemies_attack
		puts "--------------------------------------"
		ennemies_in_sight.each do |each_ennemie|
			if each_ennemie.life_points > 0
				each_ennemie.attacks(@human_player)
			end
		end
		puts " "
		puts "RÉSULTAT DE CE TOUR D'ATTAQUE POUR LES ADVERSAIRES :"
		puts human_player.show_state
		puts " "
		puts "--------------------------------------"
		puts "TOUR SUIVANT : Appuyez sur [ENTER]"
		print ">"
		gets.chomp	
	end


	#Gestion de la fin de partie
	def finished
		puts "FIN DE PARTIE."
		if human_player.life_points <= 0 
			puts "Loser ! Tu as perdu !"
		else puts "BRAVO ! TU AS GAGNE !"
		end
	end


	#Gestion des joueur en vue, et de l'arrivée de nouveaux joueurs
	def new_players_in_sight 
	    if @players_left == @ennemies_in_sight.size
	      puts "Tous les ennemis sont déjà en vue"
	    else puts "IMPORTANT : ARRIVÉE DE NOUVEAUX ENNEMIS EN COURS !"
	    	puts "Press [ENTER]"
			print ">"
			puts gets.chomp
	      result = rand(1..6)
	      if result == 1
	        puts "FAUSSE ALERTE : aucun nouvel adversaire n'arrive."
	      elsif result == 2 || result == 3 || result == 4
	        puts "ATTENTION : un nouvel ennemi fait son apparition !"
	        @ennemies_in_sight << Player.new("player_#{@@rl.sample}")
	      elsif result >= 5 && result <= 6
	        puts "ATTENTION : deux nouveaux ennemis font leur apparition !"
	        @ennemies_in_sight << Player.new("player_#{@@rl.sample}")
	        @ennemies_in_sight << Player.new("player_#{@@rl.sample}")
	      end
	    end
	    puts "Press [ENTER]"
	    print ">"
		gets.chomp
	end

end 