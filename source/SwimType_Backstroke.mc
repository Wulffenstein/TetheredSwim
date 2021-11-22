

class SwimType_Backstroke extends SwimTypeBase
{
    public function initialize()
    {
        SwimTypeBase.initialize();
    } 

    public function swimStrokeType() as int 
    {
        return Activity.SWIM_STROKE_BACKSTROKE;
    }

    public function swimName() as String
    {
        return "Backstroke";
    }
}