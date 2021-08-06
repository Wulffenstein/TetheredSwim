class Count_BackStroke extends CountBase
{
    function initialize()
    {
        CountBase.initialize();
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