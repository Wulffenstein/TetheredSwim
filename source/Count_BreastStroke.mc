class Count_BreastStroke extends CountBase
{
    function initialize()
    {
        CountBase.initialize();
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