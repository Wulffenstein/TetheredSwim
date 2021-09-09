import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.Time;
import Toybox.Activity;
import Toybox.System;
import Toybox.Attention;

enum ACTIVITY_STATE { INITIAL, RUNNING, PAUSED, STOPPED }

class SwimActivityController
{
    private var swimView as TetheredSwimView;
    private var session as Session?;
    private var timer as Timer.Timer?;
    private var laps as Number;
    private var swimType as SwimTypeBase;
    private var activityInfo as Activity.Info;
    private var swimActivitySession as SwimActivitySession;
    private var activityState as ACTIVITY_STATE;
    private var vibeProfile as VibeProfile;

    public function initialize(_view as TetheredSwimView)  
    {
        swimView = _view;
        swimActivitySession = new SwimActivitySession();
        activityState = INITIAL;

        vibeProfile = new Attention.VibeProfile(75,2000);

        self.loadLastSwimType();
    }

    public function onSelect() as Void
    {
        if (Toybox has :ActivityRecording) 
        {
            if (swimActivitySession.isSessionRecording())
            {
                swimActivitySession.pauseSession();
                self.stopTimer();
                activityState = PAUSED;

                WatchUi.pushView(UtilMenus.createPauseMenu(), new TetheredSwimMenuDelegate(self), WatchUi.SLIDE_UP);
            }
            else 
            {
                self.startNewSession();
            }
        }  
    }

    public function stopActivity() as Void 
    {
        swimActivitySession.saveSession();
        self.stopTimer();
        activityState = STOPPED;
        
        WatchUi.requestUpdate();
    }

    public function resumeActivity() as Void
    {
        swimActivitySession.startSession();
        self.startTimer();    
    }

    public function discardActivity() as Void
    {
        swimActivitySession.discardSession();
    }

    private function stopTimer() as Void 
    {
        if (timer != null)
        {
            timer.stop();            
        }
    }

    public function startNewSession() as Void 
    {
        swimActivitySession.createSession();
        swimActivitySession.startSession();
        
        self.startTimer(); 

        laps = 1;

        self.updateSwimLaps();
        
        WatchUi.requestUpdate();
    }

    private function startTimer() as Void
    {
        timer = new Timer.Timer();
        timer.start(method(:timerCallback),1000,true);
        activityState = RUNNING;
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
        if (swimActivitySession.isSessionRecording())
        {
            activityInfo = Activity.getActivityInfo() as Activity.Info;
            var swimTime = swimView.findDrawableById("swimTime");
            swimTime.setText(Util.formatTime(activityInfo.timerTime));
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

    private function getNotificationTime() as Number
    {
        return swimType.getAutoLap();
    }

    public function timerCallback()
    {
        WatchUi.requestUpdate();
        
        if (activityInfo.elapsedTime >= 1000 && ((activityInfo.timerTime / 1000) % self.getNotificationTime()) == 0)
        {
            self.notifyUser();
            self.incLaps();
            self.updateSwimLaps();
            swimActivitySession.addLap();
        }
    }

    public function notifyUser() as Void
    {
        Attention.playTone(Attention.TONE_LOUD_BEEP);
        Attention.vibrate([vibeProfile] as Array<Attention.VibeProfile>);
    }

    public function incLaps() as Void
    {
        laps++;
    }

    public function getActivityState() as ACTIVITY_STATE
    {
        return activityState;        
    }
}