import Toybox.ActivityRecording;
import Toybox.FitContributor;
//import Toybox.Activity;

class SwimActivitySession
{
    private enum FieldId {
        FIELD_STROKECOUNT_LAP,
        FIELD_STROKECOUNT_TOTAL,
        FIELD_CALC_DIST_LAP,
        FIELD_CALC_DIST_TOTAL
    }
    
    private var session as Session?;
    private var strokeCounter as CountBase;

    private var totalStrokeCount as Field;
    private var lapStrokeCount as Field;
    private var totalCalcDist as Field;
    private var lapCalcDist as Field;

    private var swimType as SwimTypeBase;

    public function initialize(_swimType as SwimTypeBase)
    {
        self.session = ActivityRecording.createSession({:name=>"Tethered swim", :sport=>ActivityRecording.SPORT_SWIMMING});

        self.totalStrokeCount = session.createField("totalStrokeCount", FIELD_STROKECOUNT_TOTAL, FitContributor.DATA_TYPE_UINT8, {:mesgType => FitContributor.MESG_TYPE_SESSION});
        self.lapStrokeCount = session.createField("lapStrokeCount", FIELD_STROKECOUNT_LAP, FitContributor.DATA_TYPE_UINT8, {:mesgType => FitContributor.MESG_TYPE_LAP});
        self.totalCalcDist = session.createField("totalCalcDist", FIELD_CALC_DIST_TOTAL, FitContributor.DATA_TYPE_UINT8, {:mesgType => FitContributor.MESG_TYPE_SESSION});
        self.lapCalcDist = session.createField("lapCalcDist", FIELD_CALC_DIST_LAP, FitContributor.DATA_TYPE_UINT8, {:mesgType => FitContributor.MESG_TYPE_LAP}); 

        self.swimType = _swimType;
    } 

    public function startSession() as Void
    {
        session.start(); 
        
        if (self.strokeCounter == null)
        {
            self.strokeCounter = CountBase.newFromStrokeType(self.swimType.strokeType());
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
        self.compute();
        
        self.session.addLap();

        self.strokeCounter.newLap();
    }

    public function isSessionRecording() as Boolean 
    {
        return (self.session != null) && self.session.isRecording();
    }

    public function setMPrStroke(_mPrStroke as Number) as Void
    {
        self.mPrStroke = _mPrStroke;        
    }

    public function setStrokeType(_strokeType as Activity.SwimStrokeType) as Void
    {
        self.strokeType = _strokeType;
    }

    public function compute()
    {
        var strokesLap = self.strokeCounter.strokesInCurrentLap();
        var strokesTotal = self.strokeCounter.totalStrokes();
        
        self.totalStrokeCount.setData(strokesTotal);
        self.lapStrokeCount.setData(strokesLap);
        self.totalCalcDist.setData(strokesTotal * self.swimType.getMPrStroke());
        self.lapCalcDist.setData(strokesLap * self.swimType.getMPrStroke());
    }
}