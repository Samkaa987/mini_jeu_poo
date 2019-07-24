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
			print "
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		puts " "
		puts "Voici ton état :".center(215)
		puts "Le joueur #{human_player.name} a #{human_player.life_points} points de vie.".center(215)
		puts "Il te reste encore #{@ennemies_in_sight.size * 10} ennemis en vue et #{@players_left * 10} ennemis à vaincre.".center(215)
		puts "
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"	
	end


	#Affiche le menu
	def menu
		puts " "
		puts "Quelle action veux-tu effectuer ?".center(215)
		puts "A - Chercher une meilleure arme.".center(215)
		puts "S - Chercher à se soigner.".center(215)
		puts " "
		puts "Attaquer des ennemis en vue :".center(215)
		0.upto(@ennemies_in_sight.size - 1) do |index|
      	print "#{index} - ".rjust(90)
      	@ennemies_in_sight[index].show_state
      	print "" #Affichage du status de l'ennemi
      	end
		puts " "
		puts "
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"	
	
	end


	#Traitement de l'action choisie dans le menu
	def menu_choice
		print ">"
		result = gets.chomp.to_s
		if result == "a" || result == "A"
			puts "#{@human_player.search_weapon}".rjust(90)
		elsif result == "s" || result == "S"
			puts "#{@human_player.search_health_pack}".rjust(90)
		elsif result == "0"
			puts "#{@human_player.attacks(@ennemies_in_sight[0])}".rjust(90)
			if @ennemies_in_sight[0].life_points <= 0
				kill_player(@ennemies_in_sight[0])
			end
		elsif result == "1"
			puts "#{@human_player.attacks(@ennemies_in_sight[1])}".rjust(90)
			if @ennemies_in_sight[1].life_points <= 0
				kill_player(@ennemies_in_sight[1])
			end
		elsif result == "2"
			puts "#{@human_player.attacks(@ennemies_in_sight[2])}".rjust(90)
			if @ennemies_in_sight[2].life_points <= 0
				kill_player(@ennemies_in_sight[2])
			end
		elsif result == "3"
			puts "#{@human_player.attacks(@ennemies_in_sight[3])}".rjust(90)
			if @ennemies_in_sight[3].life_points <= 0
				kill_player(@ennemies_in_sight[3])
			end
		else puts "Tu n'as pas choisi d'action à effectuer, dommage..".center(215)
		end
		puts " "
		puts "RESULTAT DE CE TOUR D'ATTAQUE POUR #{@human_player.name} :".center(215)
		print "#{@human_player.show_state}".rjust(90)
		@ennemies_in_sight.each do |n|
			print "#{n.show_state}".rjust(90)
		end
		puts " "
		puts "ATTENTION : c'est désormais au tour des ennemis de t'attaquer !".center(215)
		puts "Appuyez sur [ENTER]".center(215)
		puts gets.chomp	
	end


	#Gestion de la phase d'attaque des ennemis
	def ennemies_attack
		puts "
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"	
		ennemies_in_sight.each do |each_ennemie|
			if each_ennemie.life_points > 0
				each_ennemie.attacks(@human_player)
			end
		end
		puts " "
		puts "RESULTAT DE CE TOUR D'ATTAQUE POUR LES ADVERSAIRES :".center(215)
		puts human_player.show_state
		puts "TOUR SUIVANT : Appuyez sur [ENTER]".center(215)
		gets.chomp	
	end


	#Gestion de la fin de partie
	def finished
		puts "FIN DE PARTIE."
		if human_player.life_points <= 0 
			puts "Loser ! Tu as perdu !".center(215)
		else puts "BRAVO ! TU AS GAGNE !".center(215)
		end
	end


	#Gestion des joueur en vue, et de l'arrivée de nouveaux joueurs
	def new_players_in_sight 
	    if @players_left == @ennemies_in_sight.size
	    	puts " "
	      puts "TOUS LES ENNEMIS SONT DEJA EN VUE.".center(215)
	    else puts " "
	    	puts "IMPORTANT : ARRIVÉE DE NOUVEAUX ENNEMIS EN COURS !".center(215)
	    	puts "Press [ENTER]".center(215)
			gets.chomp
	      result = rand(1..6)
	      if result == 1
	        puts "FAUSSE ALERTE : Aucune nouvelle escouade n'arrive.".center(215)
	      elsif result == 2 || result == 3 || result == 4
	        puts "ATTENTION : Un nouveau groupe de combat en approche !".center(215)
	        @ennemies_in_sight << Player.new("Escouade_#{@@rl.sample}")
	      elsif result >= 5 && result <= 6
	        puts "ATTENTION : Deux nouveaux groupes de combat en approche !".center(215)
	        @ennemies_in_sight << Player.new("Escouade_#{@@rl.sample}")
	        @ennemies_in_sight << Player.new("Escouade_#{@@rl.sample}")
	      end
	    end
	    puts "Press [ENTER]".center(215)
		gets.chomp
	end

end 