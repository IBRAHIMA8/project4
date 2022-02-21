# Écrivez la logique qui fait que le joueur (lui-même) entre "0 ~ 2".
class Player
  def hand
    # Affichez une phrase qui permet au joueur de sélectionner une main pierre-papier-ciseaux.
    puts "Veuillez saisir un nombre."

     puts "0: Goo, 1: Choki , 2: Par"
# Remplacez la valeur d'entrée du joueur dans la variable "input_hand".
  #Astuce : Découvrons la méthode gets.
    #input_hand = gets.to_i
    input_hand = gets.chomp
  # Si "input_hand" est soit "0, 1, 2", le processus itératif se termine, et si ce n'est pas le cas (y compris l'alphabet), le processus itératif continue.
    while true
      unless input_hand == "0" || input_hand == "1" || input_hand == "2"
      puts "Veuillez entrer un nombre entre 0 et 2."
        input_hand = gets.chomp
      # Conseil : si vous souhaitez renvoyer une valeur de retour pour mettre fin au processus itératif, utilisez "return".
      else
      return input_hand.to_i # sinon Sinon
      end
      # Affiche un texte demandant au joueur d'entrer "0 à 2".
      puts "Veuillez entrer un nombre entre 0 et 2."
      puts "0: Goo, 1: Choki, 2: Par"
      input_hand = gets.chomp # Assignez la valeur d'entrée du joueur à la variable "input_hand".
    end
  end
end

# Écrivez la logique selon laquelle l'autre partie génère aléatoirement la valeur de "0 ~ 2".
class Enemy
    # Obtenez les valeurs de # Goo, Choki et Par au hasard.
    def hand
    return rand(0..2) # Obtenez une valeur aléatoire pour Goo, Choki ou Par.
    end
  end
# Écrivez la logique pour jouer pierre-papier-ciseaux avec "0 ~ 2" entré par le joueur (vous-même) et "0 ~ 2" généré aléatoirement par l'ennemi, et affichez le résultat sur la console.
class Janken
  def pon(player_hand, enemy_hand)
    # Remplacez ["goo", "choki", "par"] la variable "janken".
    janken = ["Goo", "Choki", "Par"]
  # "La main de l'autre partie est # {la main de l'autre partie}." Est la sortie.
    puts "La main de l'adversaire est#{janken[enemy_hand]}"
    ​
    if player_hand == enemy_hand
      puts "Aiko"

      return true # Renvoie "true" pour exécuter à plusieurs reprises des roche-papier-ciseaux.
      # Conseil : Vous pouvez utiliser "return" pour renvoyer une valeur de retour. Cependant, en Ruby, lors du retour d'une valeur de retour, il est courant d'omettre "return".
    elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
      puts "Vous gagnez"
      return false #pour terminer pierre-papier-ciseaux.
    else
      puts "Vous perdez"
        return false # pour terminer pierre-papier-ciseaux.
    end
  end
end
# Écrivez la logique pour exécuter le jeu roche-papier-ciseaux.
class GameStart
  #En utilisant self, vous pouvez appeler la méthode jankenpon en utilisant le nom de la classe sans instancier GameStart.
  def self.jankenpon
    # Remplacez le Player instancié par la variable "player".

    player = Player.new
    #Assignez une instanciation d'Enemy à la variable "ennemi".
    enemy = Enemy.new
    #Assignez une instanciation de Janken à la variable "janken".
    janken = Janken.new
    next_game = true
    # Attribuons "true" à la variable "next_game".
    # Si "next_game" est "false", le processus itératif se termine, et s'il est "true", le processus itératif continue.
    while next_game
      # J'utilise des roche papier ciseaux avec "janken.pon (player.hand, ennemi.hand)".
    #Je lance pierre-papier-ciseaux avec "janken.pon (joueur.main, ennemi.main)".
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
# Appelez la méthode jankenpon avec le nom de la classe.
GameStart.jankenpon
