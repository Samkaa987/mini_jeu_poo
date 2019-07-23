require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



	puts "THE HACKING PROJECT : BATTLE ROYALE"
	puts "Press [ENTER]"
	print ">"
	gets.chomp

	player1 = Player.new("JOSIANNE")
	puts "À ma gauche, le premier combattant : #{player1.name} !"
	player2 = Player.new("JOSÉ")
	puts "À ma droite, le second combattant : #{player2.name} !"
	puts " "
	puts "Press [ENTER]"
	print ">"
	gets.chomp


	nb_round = 1
	while player1.life_points > 0 && player2.life_points > 0
		puts "ROUND #{nb_round}"
		puts "Voici l'état des deux combattants :"
		print player1.show_state
		puts player2.show_state
		puts "Passons à la phase d'attaque [ENTER]"
		print ">"
		gets.chomp
		player1.attacks(player2)
		if player2.life_points <= 0
			break
		end
		puts "Appuyez sur [ENTER]"
		print ">"
		puts gets.chomp
		player2.attacks(player1)
		puts "Appuyez sur [ENTER]"
		print ">"
		gets.chomp
		nb_round += 1
	end

	puts "FIN DE PARTIE."



