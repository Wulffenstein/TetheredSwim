import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.Time;
import Toybox.Activity;
import Toybox.System;

class TetheredSwimView extends WatchUi.View {

    private var session as Session?;
    private var timer as Timer.Timer?;
    private var laps as Number;
    private var swimCount as CountBase;
    private var activityInfo as Activity.Info;
    private const hourSeconds = 60 * 60;
    private const minSeconds = 60;
    
    function initialize() {
        View.initialize();

        swimCount = new Count_FreeStyle();
        
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        self.updateSwimType();
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        self.updateSwimTime();        
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    private function updateSwimTime() as Void
    {
        if (isSessionRecording())
        {
            activityInfo = Activity.getActivityInfo() as Activity.Info;
            var swimTime = View.findDrawableById("swimTime");
            swimTime.setText(self.formatTime(activityInfo.elapsedTime));
        }
    }

    private function updateSwimLaps() as Void
    {
        var swimLaps = View.findDrawableById("swimLaps"); 
        swimLaps.setText(Lang.format("Laps: $1$", [laps])); 
    }

    private function updateSwimType() as Void
    {
        var swimType = View.findDrawableById("swimType");
        swimType.setText(swimCount.swimName());   
    }

    public function isSessionRecording() as Boolean {
        return (session != null) && session.isRecording();
    } 

    public function stopRecording() as Void {
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

    private function notifyUser() as Void
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

    private function incLaps() as Void
    {
        laps++;
    }
}
