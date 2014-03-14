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

    end

    def new_pumpkin_sprite

      pumpkin_body = @world.new_body position: @player_plane.position,
                                      type: KDynamicBodyType

      @pumpkin_sprite = PhysicsSprite.new file_name: 'pumpkin.jpg',
                                              body: pumpkin_body
      
      @pumpkin_sprite
      
    end

    
  end
end
