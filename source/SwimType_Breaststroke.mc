<<<<<<< HEAD


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
    
=======


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
    
>>>>>>> 5e1c8a5d4c2d60f2a75185a730b79a008fde1f7d
}