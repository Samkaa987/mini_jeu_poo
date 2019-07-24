require 'bundler'
Bundler.require

#On appelle est fichiers game.rb et player.rb
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

def intro

	puts "====================================================================================================================================================================================================".center(125)
	puts "                                                  

             ▄▄▄▄▄▄▄▄▄▄▄ ▄         ▄ ▄▄▄▄▄▄▄▄▄▄▄       ▄         ▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄    ▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄        ▄ ▄▄▄▄▄▄▄▄▄▄▄                                                           
            ▐░░░░░░░░░░░▐░▌       ▐░▐░░░░░░░░░░░▌     ▐░▌       ▐░▐░░░░░░░░░░░▐░░░░░░░░░░░▐░▌  ▐░▐░░░░░░░░░░░▐░░▌      ▐░▐░░░░░░░░░░░▌     
             ▀▀▀▀█░█▀▀▀▀▐░▌       ▐░▐░█▀▀▀▀▀▀▀▀▀      ▐░▌       ▐░▐░█▀▀▀▀▀▀▀█░▐░█▀▀▀▀▀▀▀▀▀▐░▌ ▐░▌ ▀▀▀▀█░█▀▀▀▀▐░▌░▌     ▐░▐░█▀▀▀▀▀▀▀▀▀      
                 ▐░▌    ▐░▌       ▐░▐░▌               ▐░▌       ▐░▐░▌       ▐░▐░▌         ▐░▌▐░▌      ▐░▌    ▐░▌▐░▌    ▐░▐░▌                 
                 ▐░▌    ▐░█▄▄▄▄▄▄▄█░▐░█▄▄▄▄▄▄▄▄▄      ▐░█▄▄▄▄▄▄▄█░▐░█▄▄▄▄▄▄▄█░▐░▌         ▐░▌░▌       ▐░▌    ▐░▌ ▐░▌   ▐░▐░▌ ▄▄▄▄▄▄▄▄          
                 ▐░▌    ▐░░░░░░░░░░░▐░░░░░░░░░░░▌     ▐░░░░░░░░░░░▐░░░░░░░░░░░▐░▌         ▐░░▌        ▐░▌    ▐░▌  ▐░▌  ▐░▐░▌▐░░░░░░░░▌         
                 ▐░▌    ▐░█▀▀▀▀▀▀▀█░▐░█▀▀▀▀▀▀▀▀▀      ▐░█▀▀▀▀▀▀▀█░▐░█▀▀▀▀▀▀▀█░▐░▌         ▐░▌░▌       ▐░▌    ▐░▌   ▐░▌ ▐░▐░▌ ▀▀▀▀▀▀█░▌          
                 ▐░▌    ▐░▌       ▐░▐░▌               ▐░▌       ▐░▐░▌       ▐░▐░▌         ▐░▌▐░▌      ▐░▌    ▐░▌    ▐░▌▐░▐░▌       ▐░▌          
                 ▐░▌    ▐░▌       ▐░▐░█▄▄▄▄▄▄▄▄▄      ▐░▌       ▐░▐░▌       ▐░▐░█▄▄▄▄▄▄▄▄▄▐░▌ ▐░▌ ▄▄▄▄█░█▄▄▄▄▐░▌     ▐░▐░▐░█▄▄▄▄▄▄▄█░▌          
                 ▐░▌    ▐░▌       ▐░▐░░░░░░░░░░░▌     ▐░▌       ▐░▐░▌       ▐░▐░░░░░░░░░░░▐░▌  ▐░▐░░░░░░░░░░░▐░▌      ▐░░▐░░░░░░░░░░░▌         
                  ▀      ▀         ▀ ▀▀▀▀▀▀▀▀▀▀▀       ▀         ▀ ▀         ▀ ▀▀▀▀▀▀▀▀▀▀▀ ▀    ▀ ▀▀▀▀▀▀▀▀▀▀▀ ▀        ▀▀ ▀▀▀▀▀▀▀▀▀▀▀          

                                                                         ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄      
                                                                        ▐░░░░░░░░░░░▐░░░░░░░░░░░▐░░░░░░░░░░░▐░░░░░░░░░░░▐░░░░░░░░░░░▐░░░░░░░░░░░▐░░░░░░░░░░░▌     
                                                                        ▐░█▀▀▀▀▀▀▀█░▐░█▀▀▀▀▀▀▀█░▐░█▀▀▀▀▀▀▀█░▌▀▀▀▀▀█░█▀▀▀▐░█▀▀▀▀▀▀▀▀▀▐░█▀▀▀▀▀▀▀▀▀ ▀▀▀▀█░█▀▀▀▀      
                                                                        ▐░▌       ▐░▐░▌       ▐░▐░▌       ▐░▌     ▐░▌   ▐░▌         ▐░▌              ▐░▌          
                                                                        ▐░█▄▄▄▄▄▄▄█░▐░█▄▄▄▄▄▄▄█░▐░▌       ▐░▌     ▐░▌   ▐░█▄▄▄▄▄▄▄▄▄▐░▌              ▐░▌        ▄  
                                                                        ▐░░░░░░░░░░░▐░░░░░░░░░░░▐░▌       ▐░▌     ▐░▌   ▐░░░░░░░░░░░▐░▌              ▐░▌       ▐░▌   
                                                                        ▐░█▀▀▀▀▀▀▀▀▀▐░█▀▀▀▀█░█▀▀▐░▌       ▐░▌     ▐░▌   ▐░█▀▀▀▀▀▀▀▀▀▐░▌              ▐░▌        ▀  
                                                                        ▐░▌         ▐░▌     ▐░▌ ▐░▌       ▐░▌     ▐░▌   ▐░▌         ▐░▌              ▐░▌        ▄  
                                                                        ▐░▌         ▐░▌      ▐░▌▐░█▄▄▄▄▄▄▄█░▌▄▄▄▄▄█░▌   ▐░█▄▄▄▄▄▄▄▄▄▐░█▄▄▄▄▄▄▄▄▄     ▐░▌       ▐░▌  
                                                                        ▐░▌         ▐░▌       ▐░▐░░░░░░░░░░░▐░░░░░░░▌   ▐░░░░░░░░░░░▐░░░░░░░░░░░▌    ▐░▌        ▀ 
                                                                         ▀           ▀         ▀ ▀▀▀▀▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀     ▀▀▀▀▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀▀      ▀           




 

          ___________  ___  _____ _____    _____ _____ _   _______ _    _____ _____ _____        ______  ___ _____ _____ _     _____   ______ _______   _____  _     _____ 
         /  ___| ___ \\/ _ \\/  __ |  ___|  /  __ |  _  | \\ | |  ___| |  |_   _/  __ |_   _|   _   | ___ \\/ _ |_   _|_   _| |   |  ___|  | ___ |  _  \\ \\ / / _ \\| |   |  ___|
         \\ `--.| |_/ / /_\\ | /  \\| |__    | /  \\| | | |  \\| | |_  | |    | | | /  \\/ | |    (_)  | |_/ / /_\\ \\| |   | | | |   | |__    | |_/ | | | |\\ V / /_\\ | |   | |__  
          `--. |  __/|  _  | |   |  __|   | |   | | | | . ` |  _| | |    | | | |     | |         | ___ |  _  || |   | | | |   |  __|   |    /| | | | \\ /|  _  | |   |  __| 
         /\\__/ | |   | | | | \\__/| |___   | \\__/\\ \\_/ | |\\  | |   | |____| |_| \\__/\\ | |     _   | |_/ | | | || |   | | | |___| |___   | |\\ \\\\ \\_/ / | || | | | |___| |___ 
         \\____/\\_|   \\_| |_/\\____\\____/    \\____/\\___/\\_| \\_\\_|   \\_____\\___/ \\____/ \\_/    (_)  \\____/\\_| |_/\\_/   \\_/ \\_____\\____/   \\_| \\_|\\___/  \\_/\\_| |_\\_____\\____/ 
                                                                                                                                                                                                                                                                                          
                                                                                                                                ___   __   __  __ ____ 
                                                                                                                               / __) /__\\ (  \\/  ( ___)
                                                                                                                              ( (_-./(__)\\ )    ( )__) 
                                                                                                                               \\___(__)(__(_/\\/\\_(____)





	"

	puts "Press [ENTER]".center(195)
	gets.chomp
	puts "












































	"

	puts "====================================================================================================================================================================================================".center(125)
	puts "


"
	puts "INTRODUCTION".center(215)
	puts " "
	puts "L'humanité, à la suite de l'invention du vol spatial,".center(215) 
	puts "avait colonisé tant qu'elle pouvait le système solaire.".center(215) 
	puts "Cette expansion avait provoqué l'apparition d'immenses ".center(215)
	puts "corporations planétaires au sein du système solaire.".center(215)
	puts "Une fois que ces dernières n'ont plus été capables ".center(215)
	puts "d'aller plus loin, elles se sont retournées les unes".center(215) 
	puts "contre les autres dans des guerres inter-mondes ".center(215)
	puts "incessantes.".center(215)
	puts " "
	puts "La découverte d'une lune habitable non répertoriée apparut".center(215)
	puts "alors à certains comme « le dernier espoir de l'humanité »".center(215)
	puts "après de nombreuses années de guerre.".center(215) 
	puts "Rapidement, de nombreux colons s'y installèrent, pour atterrir".center(215) 
	puts "sous un ciel inconnu qu'ils furent incapables de localiser.".center(215) 
	puts "Cette lune fut baptisée HOPEA, et la première ville construite".center(215) 
	puts "dans ce nouvel endroit fut appelé « New Chance ».".center(215)
	puts " "
	puts "Les Humains exploraient et colonisaient cette nouvelle lune à".center(215) 
	puts "une vitesse incroyable.".center(215) 
	puts "Mais les colons qui s'y étaient installés étaient encore".center(215)
	puts "totalement dépendants de leur patrie d'origine, lorsqu'une".center(215) 
	puts "tentative de sécession se produisit.".center(215)
	puts "L'économie de HOPEA s'effondra sur elle-même, détruisant la".center(215) 
	puts "civilisation naissante, dans une catastrophe apocalyptique".center(215) 
	puts "d'une ampleur encore jamais connue par l'humanité.".center(215) 
	puts "Coupés de toutes ressources, les humains pris au piège étaient".center(215) 
	puts "dans un total isolement.".center(215) 
	puts "Certains de ces humains durent lutter contre l'extinction, et".center(215) 
	puts "la civilisation et tous ses progrès technologiques disparurent.".center(215)
	puts " "
	puts "Cependant, une poignée d'humains survécut. La civilisation".center(215) 
	puts "réapparut et se développa.".center(215)
	puts "Cependant, les alliances et corporations planétaires du système".center(215) 
	puts "décidèrent de mettre un terme au développement de HOPEA.".center(215)
	puts "Ils lancèrent une opération militaire sans précédent, dans le".center(215) 
	puts "but d'éradiquer une fois pour toute cette nouvelle civilisation.".center(215)
	puts " "
	puts "Au milieu d'une bataille desepérée, vous vous apprêter à".center(215)
	puts "repousser les forces inter-planétaires afin de sauver votre".center(215) 
	puts "civilisation de l'extinction.".center(215)
	puts "




"
	puts "Press [ENTER]".center(215)
	gets.chomp
	puts "












































	"

	puts "====================================================================================================================================================================================================".center(125)
	puts "



                                  ▄         ▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ 
                                 ▐░▌       ▐░▐░░░░░░░░░░░▐░░░░░░░░░░░▐░░░░░░░░░░░▐░░░░░░░░░░░▌
                                 ▐░▌       ▐░▐░█▀▀▀▀▀▀▀█░▌▀▀▀▀█░█▀▀▀▀ ▀▀▀▀█░█▀▀▀▀▐░█▀▀▀▀▀▀▀▀▀ 
                                 ▐░▌       ▐░▐░▌       ▐░▌    ▐░▌         ▐░▌    ▐░▌          
                                 ▐░▌   ▄   ▐░▐░█▄▄▄▄▄▄▄█░▌    ▐░▌         ▐░▌    ▐░█▄▄▄▄▄▄▄▄▄ 
                                 ▐░▌  ▐░▌  ▐░▐░░░░░░░░░░░▌    ▐░▌         ▐░▌    ▐░░░░░░░░░░░▌
                                 ▐░▌ ▐░▌░▌ ▐░▐░█▀▀▀▀█░█▀▀     ▐░▌         ▐░▌    ▐░█▀▀▀▀▀▀▀▀▀ 
                                 ▐░▌▐░▌ ▐░▌▐░▐░▌     ▐░▌      ▐░▌         ▐░▌    ▐░▌          
                                 ▐░▌░▌   ▐░▐░▐░▌      ▐░▌ ▄▄▄▄█░█▄▄▄▄     ▐░▌    ▐░█▄▄▄▄▄▄▄▄▄ 
                                 ▐░░▌     ▐░░▐░▌       ▐░▐░░░░░░░░░░░▌    ▐░▌    ▐░░░░░░░░░░░▌
                                  ▀▀       ▀▀ ▀         ▀ ▀▀▀▀▀▀▀▀▀▀▀      ▀      ▀▀▀▀▀▀▀▀▀▀▀ 
                                                             
                                                                       ▄         ▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄         ▄ ▄▄▄▄▄▄▄▄▄▄▄             
                                                                      ▐░▌       ▐░▐░░░░░░░░░░░▐░▌       ▐░▐░░░░░░░░░░░▌            
                                                                      ▐░▌       ▐░▐░█▀▀▀▀▀▀▀█░▐░▌       ▐░▐░█▀▀▀▀▀▀▀█░▌            
                                                                      ▐░▌       ▐░▐░▌       ▐░▐░▌       ▐░▐░▌       ▐░▌            
                                                                      ▐░█▄▄▄▄▄▄▄█░▐░▌       ▐░▐░▌       ▐░▐░█▄▄▄▄▄▄▄█░▌            
                                                                      ▐░░░░░░░░░░░▐░▌       ▐░▐░▌       ▐░▐░░░░░░░░░░░▌            
                                                                       ▀▀▀▀█░█▀▀▀▀▐░▌       ▐░▐░▌       ▐░▐░█▀▀▀▀█░█▀▀             
                                                                           ▐░▌    ▐░▌       ▐░▐░▌       ▐░▐░▌     ▐░▌              
                                                                           ▐░▌    ▐░█▄▄▄▄▄▄▄█░▐░█▄▄▄▄▄▄▄█░▐░▌      ▐░▌             
                                                                           ▐░▌    ▐░░░░░░░░░░░▐░░░░░░░░░░░▐░▌       ▐░▌            
                                                                            ▀      ▀▀▀▀▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀▀ ▀         ▀             
                                                             
                                                                                                       ▄▄        ▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄       ▄▄ ▄▄▄▄▄▄▄▄▄▄▄             
                                                                                                      ▐░░▌      ▐░▐░░░░░░░░░░░▐░░▌     ▐░░▐░░░░░░░░░░░▌            
                                                                                                      ▐░▌░▌     ▐░▐░█▀▀▀▀▀▀▀█░▐░▌░▌   ▐░▐░▐░█▀▀▀▀▀▀▀▀▀             
                                                                                                      ▐░▌▐░▌    ▐░▐░▌       ▐░▐░▌▐░▌ ▐░▌▐░▐░▌                      
                                                                                                      ▐░▌ ▐░▌   ▐░▐░█▄▄▄▄▄▄▄█░▐░▌ ▐░▐░▌ ▐░▐░█▄▄▄▄▄▄▄▄▄             
                                                                                                      ▐░▌  ▐░▌  ▐░▐░░░░░░░░░░░▐░▌  ▐░▌  ▐░▐░░░░░░░░░░░▌            
                                                                                                      ▐░▌   ▐░▌ ▐░▐░█▀▀▀▀▀▀▀█░▐░▌   ▀   ▐░▐░█▀▀▀▀▀▀▀▀▀             
                                                                                                      ▐░▌    ▐░▌▐░▐░▌       ▐░▐░▌       ▐░▐░▌                      
                                                                                                      ▐░▌     ▐░▐░▐░▌       ▐░▐░▌       ▐░▐░█▄▄▄▄▄▄▄▄▄             
                                                                                                      ▐░▌      ▐░░▐░▌       ▐░▐░▌       ▐░▐░░░░░░░░░░░▌            
                                                                                                       ▀        ▀▀ ▀         ▀ ▀         ▀ ▀▀▀▀▀▀▀▀▀▀▀             
                                                             










"
	puts "Quel est votre nom, Combattant ?".center(215)
	print ">"
	human_name = gets.chomp
	puts "Bienvenue, #{human_name} ! Il sera bientôt temps de rencontrer nos adversaires !".center(215)
	my_game = Game.new(human_name) #Création du jeu avec avec saisie du nom du héros
	puts "QUE LE COMBAT COMMENCE !".center(215)
	puts "Press [ENTER]".center(215)
	gets.chomp
	return my_game

puts "

























	"



end


def round(nb_round)

	puts "====================================================================================================================================================================================================".center(125)
	puts" "
	puts "| ASSAUT N° #{nb_round} |".center(215)
	puts " "
	puts "====================================================================================================================================================================================================".center(125)

	
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