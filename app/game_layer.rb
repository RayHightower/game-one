class GameLayer < Joybox::Core::Layer

  def on_enter

    @player_plane = Sprite.new file_name: 'biplane.jpg',
                                position: [108, 147]

    add_child(@player_plane)
    
  end
end
