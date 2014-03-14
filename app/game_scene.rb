class GameScene < Joybox::Core::Scene

  def on_enter

    background_layer = BackgroundLayer.new

    add_child(background_layer)
    
  end
end
