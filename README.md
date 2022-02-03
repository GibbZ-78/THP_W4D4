# THP W4D4

## Rendu (validant) de Jean-Baptiste VIDAL pour le 4ème jour de la 4ème semaine du cursus THP "Développeur" - Hiver 2022

### Information
- 4ème jour d'apprentissage de la POO Ruby (Jeu de morpion)
- 2ème fois (et pas la dernière) que j'ajoute un Gemfile (pas super complet mais là quand même) maintenant que j'en ai compris l'intérêt :smile:

### Disclaimer
- Ai instancié une arborescence Rspec mais n'ai pas utilisée la gem car tests unitaires sans intérêt à ce niveau d'exercice
- Pas d'utilisation de Rubocop : on peut écrire du code à peu près propre / normé sans se faire Bigbrotherer, que diable :wink:!
- Pas d'utilisation de Pry : franchement, vu les progs qu'on pond, pas encore utile d'avoir une exécution pas à pas & Co...
  
### Table of content
- tictactoe.rb - Classe hébergeant le programme principal et le lançant par instanciation d'un objet Tictactoe
- lib/apps/game.rb - Classe de gestion de la mécanique du jeu (création de l'environnement, tours de jeu, victoire / défaite...)
- lib/apps/player.rb - Classe ges gestion des joueurs
- lib/apps/board.rb - Classe de gestion du plateau de jeu (une grille n*m où généralement n = m = 3)
- lib/apps/square.rb - Classe de gestion des cases du plateau de jeu (construction de la 'board', états ('vide', 'j1', 'j2'... 'jN'))
- lib/views/show.rb - Classe d'affichage / interaction avec les joueurs (écran d'accueil, menu de jeu, écran de fin de partie...). Isoler ainsi la partie "graphique" (on se calme, on parle juste de texte, pour le moment) permettra sûrement de faire plus asiément évoluer le jeu en mode graphique (via Ruby2D ou Gosu, si j'arrive à les faire fonctionner un jour, par-dessus WSL...)
- README.md - Le charabia que tu es en train de lire... Et jusqu'au bout, en plus... Belle endurance :wink:!  

### How to
1. Clone the current repo
2. Make sur the "Bundle" gem is installed on your (virtual) machine
3. If so, then launch "bundle" or "bundler" to gather and bind all gems listed in the Gemfile(*)
4. If all went well, you should now be able to launch the main program by throwing a "ruby tictactoe.rb" at your favorite xTerm :wink:
5. Now, lay back and let this simple Morpion / Tic-Tac-Toe  program bring (back?) light and joy into your life!

(*) Despite I'm using a ".gitignore" file, might be you need to delete an existing "Gemfile.lock" beforehand...

_Enjoy, Wanderer :wink:_
