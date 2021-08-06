class Count_FreeStyle extends CountBase
{
    function initialize()
    {
        CountBase.initialize();
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