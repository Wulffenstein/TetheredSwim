import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.Time;
import Toybox.Activity;
import Toybox.System;

class SwimActivityController
{
    private var swimView as TetheredSwimView;
    private var session as Session?;
    private var timer as Timer.Timer?;
    private var laps as Number;
    private var swimType as SwimTypeBase;
    private var activityInfo as Activity.Info;
    private const hourSeconds = 60 * 60;
    private const minSeconds = 60;

    public function initialize(_view as TetheredSwimView)  
    {
        swimView = _view;

        self.loadLastSwimType();
    }

    public function onSelect() as Void
    {
        if (Toybox has :ActivityRecording) 
        {
            if (self.isSessionRecording())
            {
                self.stopRecording();
            }
            else 
            {
                self.startRecording();
            }
        }  
    }

    public function loadLastSwimType() as Void
    {
        var dataStorage = new DataStorage();
        var lastSwimTypeId = dataStorage.getLastSwimType();
        var lastSwimType = SwimTypeBase.newFromStrokeType(lastSwimTypeId);

        self.setSwimType(lastSwimType);
    }

    public function setSwimType(_swimType as SwimTypeBase) as Void
    {
        swimType = _swimType;
    }
    public function getSwimType() as SwimTypeBase
    {
        return swimType;
    }

    public function updateSwimTime() as Void
    {
        if (isSessionRecording())
        {
            activityInfo = Activity.getActivityInfo() as Activity.Info;
            var swimTime = swimView.findDrawableById("swimTime");
            swimTime.setText(self.formatTime(activityInfo.elapsedTime));
        }
    }

    public function updateSwimLaps() as Void
    {
        var swimLaps = swimView.findDrawableById("swimLaps"); 
        swimLaps.setText(Lang.format("Laps: $1$", [laps])); 
    }

    public function updateSwimTypeName() as Void
    {
        var swimTypeName = swimView.findDrawableById("swimType");
        swimTypeName.setText(swimType.swimName());   
    }

    public function isSessionRecording() as Boolean 
    {
        return (session != null) && session.isRecording();
    } 

    public function stopRecording() as Void 
    {
        self.stopSession();
        self.stopTimer();
        
        WatchUi.requestUpdate();
    }

    private function stopSession() as Void
    {
        if ((Toybox has :ActivityRecording) && isSessionRecording()) {
            session.stop();
            session.save();
            session = null;
        }
    }

    private function stopTimer() as Void 
    {
        if (timer != null)
        {
            timer.stop();            
        }
    }

    public function startRecording() as Void 
    {
        self.startSession();
        self.startTimer(); 

        laps = 1;

        self.updateSwimLaps();
        
        WatchUi.requestUpdate();
    }

    private function startSession() as Void 
    {
        session = ActivityRecording.createSession({:name=>"Tethered swim", :sport=>ActivityRecording.SPORT_SWIMMING});
        session.start();   
    }

    private function startTimer() as Void
    {
        timer = new Timer.Timer();
        timer.start(method(:timerCallback),1000,true);
    }

    private function getNotificationTime() as Number
    {
        return 30;
    }

    public function timerCallback()
    {
        WatchUi.requestUpdate();
        
        if (activityInfo.elapsedTime >= 1000 && ((activityInfo.elapsedTime / 1000) % self.getNotificationTime()) == 0)
        {
            self.notifyUser();
            self.incLaps();
            self.updateSwimLaps();
        }
    }

    public function notifyUser() as Void
    {
        Attention.playTone(Attention.TONE_LOUD_BEEP);
    }

    private function formatTime(_time as Number) as String
    {
        if (_time != null)
        {
            _time = _time / 1000;
            var hours = _time / hourSeconds;
            _time = _time - (hours * hourSeconds);
            var mins = _time / minSeconds;
            _time = _time - (mins * minSeconds);
            var secs = _time;
            
            var timeStr = Lang.format("$1$:$2$:$3$", [hours.format("%02d"),mins.format("%02d"),secs.format("%02d")]);

            return timeStr;
        }

        return "N/A";
    }

    public function incLaps() as Void
    {
        laps++;
    }
}