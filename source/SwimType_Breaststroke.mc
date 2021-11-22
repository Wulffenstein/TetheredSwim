

class SwimType_Breaststroke extends SwimTypeBase
{
    public function initialize()
    {
        SwimTypeBase.initialize();
    } 

    public function swimStrokeType() as int 
    {
        return Activity.SWIM_STROKE_BREASTSTROKE;
    }

    public function swimName() as String
    {
        return "Breaststroke";
    } 
    
}