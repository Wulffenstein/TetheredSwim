import Toybox.Lang;
import Toybox.Activity;

class SwimTypeBase
{
    private var autoLap as Number;
    private var secsPr100m as Number;
    private var dataStorage as DataStorage;
    private var mPrStroke as Number;

    public function initialize()
    {
        dataStorage = new DataStorage();   

        self.loadSettings();
    }

    public static function newFromStrokeType(_swimStrokeType as int)
    {
        switch(_swimStrokeType)     
        {
            case Activity.SWIM_STROKE_BACKSTROKE: return new SwimType_Backstroke();
            case Activity.SWIM_STROKE_BREASTSTROKE: return new SwimType_Breaststroke();
            case Activity.SWIM_STROKE_BUTTERFLY: return new SwimType_Butterfly();
            case Activity.SWIM_STROKE_FREESTYLE: return new SwimType_Freestyle();
            default: throw new Lang.Exception(Lang.format("Unsupported swim stroke type: $1$", [_swimStrokeType]));
        }

    }

    private function loadSettings() as Void
    {
        self.setAutoLap(dataStorage.getAutoLap(self.swimStrokeType()));
        self.setSecsPr100m(dataStorage.getSecsPr100m(self.swimStrokeType()));
        self.setMPrStroke(dataStorage.getMetersPrStroke(self.swimStrokeType()));
    }
    
    public function swimStrokeType() as int 
    {
        throw new Lang.Exception("Missing override");
    }

    public function swimName() as String
    {
        throw new Lang.Exception("Missing override");
    }

    public function getAutoLap() as Number
    {
        return autoLap;        
    }

    public function setAutoLap(_autoLap as Number) as Void
    {
        autoLap = _autoLap;        
    }

    public function getSecsPr100m() as Number
    {
        return secsPr100m;
    }

    public function setSecsPr100m(_secsPr100m as Number) as Void
    {
        secsPr100m = _secsPr100m;
    }

    public function setMPrStroke(_mPrStroke as Number) as Void
    {
        self.mPrStroke = _mPrStroke;        
    }

    public function getMPrStroke() as Number
    {
        return self.mPrStroke;
    }
    
}