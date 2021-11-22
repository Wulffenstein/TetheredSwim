using Toybox.Lang;
using Toybox.Activity;
using Toybox.Sensor;

class CountBase
{
    var numberOfStrokes as Number;
    
    public function initialize()
    {
        self.resetStrokeCounter();    
    }

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

    public function start() as Void
    {
        Sensor.setEnabledSensors([Sensor.SENSOR_HEARTRATE] as Array<SensorType>);
        Sensor.enableSensorEvents(method(:onSensor));
    }

    public function resetStrokeCounter() as Void
    {
        numberOfStrokes = 0;
    }

    public function onSensor(sensorInfo as Info) as Void
    {
        
    }
    
    public function strokesPerRevolution() as int 
    {
        
        throw new Lang.Exception("Missing override");
    }
}