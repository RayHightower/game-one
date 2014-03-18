class GameLayer < Joybox::Core::Layer

  def on_enter
    @yellow_plane = Sprite.new file_name: 'yellow-biplane-transparent.png',
                                position: [500, 200 ] # Screen.half_height]
    add_child(@yellow_plane)

    @world = World.new gravity: [0.0, -9.8]

    schedule_update do | dt |
      @world.step delta: dt
    end
    
    body = @world.new_body position: [80, 200 ]  # Screen.half_height]

    @blue_plane = PhysicsSprite.new file_name: 'blue-biplane-transparent.png',
                                      body: body
    add_child(@blue_plane)
    
    init_controls
  end

  def init_controls
    on_touches_began do | touches, event |
      starting_touch = touches.any_object
      @starting_touch_location = starting_touch.location
    end

    on_touches_ended do | touches, event |
      end_touch = touches.any_object
      end_touch_location = end_touch.location
      pumpkin = new_pumpkin_sprite
      add_child(pumpkin)
      pumpkin.body.apply_force force: (end_touch_location - @starting_touch_location)
    end

    def new_pumpkin_sprite
      pumpkin_body = @world.new_body position: @yellow_plane.position,
                                      type: KDynamicBodyType
      @pumpkin_sprite = PhysicsSprite.new file_name: 'pumpkin-transparent.png',
                                              body: pumpkin_body
      @pumpkin_sprite
    end
  end
end
