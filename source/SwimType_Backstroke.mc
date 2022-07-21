<<<<<<< HEAD


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
=======


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
>>>>>>> 5e1c8a5d4c2d60f2a75185a730b79a008fde1f7d
}