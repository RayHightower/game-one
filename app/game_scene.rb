class GameScene < Joybox::Core::Scene

  def on_enter

    background_layer = BackgroundLayer.new
    add_child(background_layer)
    
    game_layer = GameLayer.new
    add_child(game_layer)

  end
end
