import Toybox.ActivityRecording;

class SwimActivitySession
{
    private var session as Session?;
    private var strokeCounter as CountBase;
    private var strokeCountField;
    private var mPrStroke as Nunmber;

    public function createSession() as Void
    {
        self.session = ActivityRecording.createSession({:name=>"Tethered swim", :sport=>ActivityRecording.SPORT_SWIMMING});
        self.strokeCountField = session.createField("Strokes", 1, FitContributor.DATA_TYPE_UINT8, {:mesgType => FitContributor.MESG_TYPE_LAP});
        self.strokeCountField = session.createField("CalcDist", 2, FitContributor.DATA_TYPE_UINT8, {:mesgType => FitContributor.MESG_TYPE_LAP});

        //TODO: Add stroke field pr lap 
        //TODO: Add calc. dist field pr lap 
    }  

    public function startSession() as Void
    {
        session.start(); 
        
        if (self.strokeCounter == null)
        {
            self.strokeCounter = CountBase.newFromStrokeType(self.swimType.swimStrokeType);
        }
        
        self.strokeCounter.start();
    }

    public function saveSession() as Void
    {
        if (self.strokeCounter != null)
        {
            self.strokeCounter.stop();
        }
        
        self.session.stop(); 
        self.session.save();
        self.session = null;

        System.exit();
    }

    public function pauseSession() as Void
    {
        self.session.stop();

        if (self.strokeCounter != null)
        {
            self.strokeCounter.stop();
        }
    }

    public function discardSession() as Void
    {
        self.session.stop();
        self.session.discard();        
        self.session = null;

        System.exit();
    }

    public function addLap() as Void
    {
        self.session.addLap();
    }

    public function isSessionRecording() as Boolean 
    {
        return (self.session != null) && self.session.isRecording();
    }

    public function setMPrStroke(_mPrStroke as Number) as Void
    {
        self.mPrStroke = _mPrStroke;        
    }
}