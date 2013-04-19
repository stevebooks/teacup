class RootController < UIViewController
  stylesheet :root

  layout :root do
    @label = subview(UILabel, :label)
    @button = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect), :button)
    @switch = subview(UISwitch, :switch)
  end  

  def viewDidLoad
  	super
    auto do
      vertical '|-50-[label]'
    end

  	# Title for this view
  	self.title = "Autolayout Example"
  end

end
