class BackgroundLayer < Joybox::Core::Layer

  def on_enter
    background_sprite = Sprite.new file_name: 'beach.jpg',
                                    position: [Screen.half_width, Screen.half_height]

    add_child(backgroung_sprite)
    
  end
end
