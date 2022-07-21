using Toybox.Lang;
using Toybox.Activity;
import Toybox.Timer;

enum AXIS {Y = 0, X = 1, Z = 2}

class CountBase
{
    private var prevAccelValue as int;
    private var strokeCount as int;
    private var timer as Timer.Timer?;
    
    public function newFromStrokeType(_swimStrokeType as int)
    {
        switch(swimStrokeType)     
        {
            case SWIM_STROKE_BACKSTROKE: return new Count_BackStroke();
            case SWIM_STROKE_BREASTSTROKE: return new Count_BreastStroke();
            case SWIM_STROKE_BUTTERFLY: return new Count_Butterfly();
            case SWIM_STROKE_FREESTYLE: return new Count_FreeStyle();
        }   
    }
    
    public function strokesPerRevolution() as int 
    {
        throw new Lang.Exception("Missing override");
    }

    public function accelerationAxis() as AXIS
    {
        throw new Lang.Exception("Missing override");        
    }

    public function checkUpdateStrokeCount()
    {
        var info = Sensor.getInfo();

        if (info has :accel && info.accel != null) {
            var accel = info.accel;
            var accValue = accel[self.accelerationAxis()];
            if (fullStrokeDone(prevAccelValue, accValue) == true)
            {
                incStrokeCount();
            }

            prevAccelValue = accValue;
        }        
    }

    // The only time the new acceleration value is > 0 and the old value < 0 is when the arm has done a full circle = 1 stroke 
    private function fullStrokeDone(_origVal as int, _newVal as int)
    {
        return _origVal < 0 && _newVal > 0;
    }

    private function incStrokeCount()
    {
        strokeCount += strokesPerRevolution();        
    }

    public function start()
    {
        self.timer = new Timer.timer();
        self.timer.start(method(:checkUpdateStrokeCount), 50, true);
    }

    public function stop()
    {
        if (self.timer != null)
        {
            self.timer.stop();
        }
    }

    public function totalStrokes() as int
    {
        return self.strokeCount;
    }
}