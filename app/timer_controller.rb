class TimerController < UIViewController
  def viewDidLoad
    margin = 20

    @state = UILabel.new
    @state.font = UIFont.systemFontOfSize(30)
    @state.text = 'Tap to start'
    @state.textAlignment = UITextAlignmentCenter
    @state.textColor = UIColor.whiteColor
    @state.backgroundColor = UIColor.clearColor
    @state.frame = [[margin, 200], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@state)
  end
end
