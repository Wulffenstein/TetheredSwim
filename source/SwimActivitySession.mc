import Toybox.ActivityRecording;

class SwimActivitySession
{
    private var session as Session?;

    public function createSession() as Void
    {
        session = ActivityRecording.createSession({:name=>"Tethered swim", :sport=>ActivityRecording.SPORT_SWIMMING});
    }  

    public function startSession() as Void
    {
        session.start(); 
    }

    public function saveSession() as Void
    {
        session.stop(); 
        session.save();
        session = null;

        System.exit();
    }

    public function pauseSession() as Void
    {
        session.stop();
    }

    public function discardSession() as Void
    {
        session.stop();
        session.discard();        
        session = null;

        System.exit();
    }

    public function addLap() as Void
    {
        session.addLap();
    }

    public function isSessionRecording() as Boolean 
    {
        return (session != null) && session.isRecording();
    }
}