class GameLayer < Joybox::Core::Layer

  def on_enter

    @player_plane = Sprite.new file_name: 'biplane.jpg',
                                position: [258, Screen.half_height]

    add_child(@player_plane)

    @world = World.new gravity: [0.0, -9.8]

    schedule_update do | dt |
      @world.step delta: dt
    end
    
    body = @world.new_body position: [80, Screen.half_height]

    @enemy_plane = PhysicsSprite.new file_name: 'blue-biplane.jpg',
                                      body: body

    add_child(@enemy_plane)

  end
end
