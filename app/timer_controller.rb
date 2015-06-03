class TimerController < UIViewController
  MARGIN = 20

  def viewDidLoad
    init_state
    view.addSubview(@state)

    init_action
    view.addSubview(@action)
  end

  def actionTapped
    init_timer

    @action.selected = !@action.selected?
  end

  def timerFired
    @state.text = "%.1f" % (@duration += 0.1)
  end

  private

    def init_state
      state = UILabel.new
      state.font = UIFont.systemFontOfSize(30)
      state.text = 'Tap to start'
      state.textAlignment = UITextAlignmentCenter
      state.textColor = UIColor.whiteColor
      state.backgroundColor = UIColor.clearColor
      state.frame = [[MARGIN, 200], [view.frame.size.width - MARGIN * 2, 40]]

      @state = state
    end

    def init_action
      action = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      action.setTitle('Start', forState:UIControlStateNormal)
      action.setTitle('Stop', forState:UIControlStateSelected)
      action.addTarget(self, action:'actionTapped', forControlEvents:UIControlEventTouchUpInside)
      action.frame = [[MARGIN, 260], [view.frame.size.width - MARGIN * 2, 40]]

      @action = action
    end

    def init_timer
      if @timer
        @timer.invalidate
        @timer = nil
      else
        @duration = 0
        @timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector:'timerFired', userInfo:nil, repeats:true)
      end
    end
end
