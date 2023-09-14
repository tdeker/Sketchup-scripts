# Définition des paramètres
section_height_min = 3.m
section_height_max = 3.6.m
spacing = 14.5.cm
total_length = 7.m
start_position_x = -0.4.m # Position initiale le long de l'axe X
start_position_y = 2.28.m  # Position initiale le long de l'axe Y

# Récupérez le composant "Tasseau" dans le modèle SketchUp
# Assurez-vous que le composant existe déjà dans votre modèle.

# Créez un groupe pour les tasseaux
tasseaux_group = Sketchup.active_model.entities.add_group

# Obtenez la définition du composant "Tasseau"
tasseau_definition = Sketchup.active_model.definitions["TasseauLarge"]

# Obtenez la position du composant "debutMur"
#debut_mur_component = Sketchup.active_model.definitions["debutMur"]
#debut_mur_position = debut_mur_component.instances[0].transformation.origin

# Position de départ
current_position = Geom::Point3d.new(start_position_x, start_position_y, 0)

# Boucle pour créer les tasseaux
#current_position = debut_mur_position.x  # Commence à la position du composant "debutMur"
num_tasseaux = 0  # Compteur pour le nombre de tasseaux créés

while current_position.y < start_position_y + total_length
  # Calcul d'une hauteur aléatoire pour chaque tasseau
  section_height = rand(section_height_min..section_height_max)
  
  # Création d'une copie du composant "Tasseau"
  new_tasseau = tasseaux_group.entities.add_instance(tasseau_definition, current_position)
  
  # Mise à jour de la taille du tasseau en utilisant une transformation
  new_tasseau.transform!(Geom::Transformation.scaling(1, 1, section_height / tasseau_definition.bounds.depth))
  #scale_factor = section_height / tasseau_definition.bounds.depth
  #new_tasseau.transform!(Geom::Transformation.scaling(scale_factor, scale_factor, scale_factor))
  
  # Mettre à jour la position actuelle
  current_position.y += spacing
  
  # Incrémentation du compteur de tasseaux
  num_tasseaux += 1
end

# Affichez le nombre de tasseaux créés
puts "Nombre de tasseaux créés : #{num_tasseaux}"

# Rafraîchir la vue
Sketchup.active_model.active_view.refresh
