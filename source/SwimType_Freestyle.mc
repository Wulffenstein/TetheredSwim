

class SwimType_Freestyle extends SwimTypeBase
{
    public function initialize()
    {
        SwimTypeBase.initialize();
    }

    public function swimStrokeType() as int 
    {
        return Activity.SWIM_STROKE_FREESTYLE;
    }

    public function swimName() as String
    {
        return "Freestyle";
    }

}