require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'


def intro

	puts "THE HACKING PROJECT : BATTLE ROYALE"
	puts "Press [ENTER]"
	print ">"
	gets.chomp

	puts "
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

end

def init_playerh

	puts "Comment t'appelles-tu, Combattant ?"
	print ">"
	player_name = gets.chomp
	playerh = HumanPlayer.new("#{player_name}")
	puts "Bienvenue dans l'arène, #{player_name} ! Il est temps de rencontrer tes adversaires !"
	puts "Press [ENTER]"
	print ">"
	gets.chomp
	return playerh

end

def init_players

	players_array = []
	player1 = Player.new("JOSIANNE")
	players_array << player1
	puts "À ma gauche, le premier combattant : #{players_array[0].name} !"
	puts player1.show_state
	player2 = Player.new("JOSÉ")
	players_array << player2
	puts "À ma droite, le second combattant : #{players_array[1].name} !"
	puts player2.show_state
	puts " "
	puts "QUE LE COMBAT COMMENCE !"
	puts "Press [ENTER]"
	print ">"
	gets.chomp
	return players_array

end

def battle(playerh, players_array)

	nb_round = 1
	while playerh.life_points >0 && (players_array[0].life_points > 0 || players_array[1].life_points >0) 
		puts "======================================"
		puts "ROUND #{nb_round}"
		puts "Voici ton état :"
		puts playerh.show_state
		puts "======================================"
		puts "Passons à la phase d'attaque [ENTER]"
		print ">"
		gets.chomp


		puts "--------------------------------------"
		puts "Quelle action veux-tu effectuer ?"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner" 
		puts " "
		puts "attaquer un joueur en vue :"
		print "1 - "
		print players_array[0].show_state
		print "2 - "
		puts players_array[1].show_state
		print ">"
		result = gets.chomp.to_s
=begin
		while gets.chomp.to_s != "a" || gets.chomp.to_s != "s" || gets.chomp.to_s != "1" || gets.chomp.to_s != "2"
			puts "Incorrect. Veuillez sélectionner une des actions proposées."
			print ">"
			gets.chomp.to_s
		end 
=end
		if result == "a"
			playerh.search_weapon
		elsif result == "s"
			playerh.search_health_pack
		elsif result == "1"
			playerh.attacks(players_array[0])
		elsif result == "2"
			playerh.attacks(players_array[1])
		end
		puts " "
		puts "RÉSULTAT DE CE TOUR D'ATTAQUE POUR #{playerh.name} :"
		print playerh.show_state
		print players_array[0].show_state
		print players_array[1].show_state
		puts " "
		puts "--------------------------------------"
		puts "Maintenant, c'est au tour des autres joueurs de t'attaquer !"
		puts "Appuyez sur [ENTER]"
		print ">"
		puts gets.chomp


		puts "--------------------------------------"
		players_array.each do |each_player|
			if each_player.life_points > 0
				each_player.attacks(playerh)
			end
		end
		puts " "
		puts "RÉSULTAT DE CE TOUR D'ATTAQUE POUR LES ADVERSAIRES :"
		puts playerh.show_state
		puts " "
		puts "--------------------------------------"
		puts "TOUR SUIVANT : Appuyez sur [ENTER]"
		print ">"
		gets.chomp
		nb_round += 1
	end	
end

def finished(playerh)

	puts "FIN DE PARTIE."
	if playerh.life_points <= 0 
		puts "Loser ! Tu as perdu !"
	else puts "BRAVO ! TU AS GAGNE !"
	end
	
end

def perform

	intro
	playerh = init_playerh
	players_array = init_players
	battle(playerh, players_array)
	finished(playerh)
	
end

perform