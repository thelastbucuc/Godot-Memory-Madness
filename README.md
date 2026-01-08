# 🧠 Memory Madness - 2D Card Matching Game

This is the fourth project in my Godot learning journey. This project focuses on complex UI systems, responsive grid layouts, and smooth visual feedback using Tween animations.

## 📝 Learning Outcomes
Through this project, I specialized in Godot's UI system and animation tools:
- **Advanced UI Hierarchy:** Mastered the use of `VBoxContainer`, `HBoxContainer`, and `GridContainer` to create responsive game menus and level selection screens.
- **Tweening & Animations:** Implemented `PropertyTweens` to create smooth card-flip effects, scaling animations, and UI transitions, significantly improving the "game feel."
- **Game State Management:** Developed logic to handle card states (hidden, flipped, matched) and managed game-over conditions using signals.
- **Sound & Image Resources:** Created centralized managers to handle randomized card textures and synchronized audio feedback for matches and mismatches.
- **Signal-Driven Architecture:** Used custom signals to communicate between individual card nodes and the main game controller for score tracking.

## 🛠 Tech Stack
- **Engine:** Godot 4.5
- **Language:** GDScript
- **Key Concepts:** UI Containers, Tweens, Signals, and Data-driven Grid Layouts.

## 💻 Technical Snippet: Professional Card Flip
```gdscript
# Using Tweens for a smooth and polished card flip effect
func flip_card() -> void:
    var tween = get_tree().create_tween()
    tween.set_parallel(true)
    # Smoothly scaling and rotating for a professional feel
    tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.1)
    tween.tween_property(self, "rotation_degrees", 10, 0.1)
    # Return to normal after the flip
    tween.chain().tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
    tween.tween_property(self, "rotation_degrees", 0, 0.1)
```

## 📚 Credits & Acknowledgments
- **Course:** Developed as part of the ["Jumpstart to 2D Game Development"](https://www.udemy.com/course/jumpstart-to-2d-game-development-godot-4-for-beginners/) course by Richard Allbert and Martyna Olivares.
- **Assets:** Game assets provided by the course instructor.
