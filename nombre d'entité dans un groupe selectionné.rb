# Vérifie si SketchUp est en cours d'exécution
if defined?(Sketchup)
    # Récupère le modèle actif dans SketchUp
    model = Sketchup.active_model
  
    # Récupère la sélection actuelle
    selection = model.selection
  
    # Initialise un compteur pour les entités
    entity_count = 0
  
    # Vérifie si une entité de la sélection est un groupe
    if selection[0].is_a?(Sketchup::Group)
      # Récupère le groupe sélectionné
      selected_group = selection[0]
  
      # Parcourt les entités dans le groupe sélectionné
      selected_group.entities.each do |entity|
        entity_count += 1
      end
  
      # Affiche le nombre d'entités dans le groupe sélectionné
      UI.messagebox("Nombre d'entités dans le groupe sélectionné : #{entity_count}")
    else
      UI.messagebox("Sélectionnez un groupe pour compter les entités.")
    end
  else
    UI.messagebox("Ce script doit être exécuté dans SketchUp.")
  end
  