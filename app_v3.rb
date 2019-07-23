require 'bundler'
Bundler.require

#On appelle est fichiers game.rb et player.rb
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

def intro
	
	puts "THE HACKING PROJECT : BATTLE ROYALE"
	puts "Press [ENTER]"
	print ">"
	gets.chomp

	puts "------------------------------------------------ "
	puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
	puts "|Le but du jeu est d'être le dernier survivant !|"
	puts "-------------------------------------------------"

	puts "Comment t'appelles-tu, Combattant ?"
	print ">"
	human_name = gets.chomp
	puts "Bienvenue dans l'arène, #{human_name} ! Il est temps de rencontrer tes adversaires !"
	my_game = Game.new(human_name) #Création du jeu avec avec saisie du nom du héros
	puts "QUE LE COMBAT COMMENCE !"
	puts "Press [ENTER]"
	print ">"
	gets.chomp
	return my_game

end


def round(nb_round)

	puts "======================================"
	puts "ROUND #{nb_round}"
	puts "======================================"
	
end


def perform

	my_game = intro
	nb_round = 1
	while my_game.is_still_ongoing? #Tant que le jeu n'est pas terminé
		round(nb_round)
		my_game.new_players_in_sight #Arrivée de nouveaux ennemis
		my_game.show_players #Affichage de l'état du jeu
		my_game.menu #Affichage du menu des action disponibles
		my_game.menu_choice	#Traitement du choix effectué
		my_game.ennemies_attack #Les ennemis attaquent
		nb_round += 1
	end
	my_game.finished #Fin de partie

end


perform