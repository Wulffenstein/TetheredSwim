class Count_Butterfly extends CountBase
{
    function initialize()
    {
        CountBase.initialize();
    } 

    public function swimStrokeType() as int 
    {
        return Activity.SWIM_STROKE_BUTTERFLY;
    }

    public function swimName() as String
    {
        return "Butterfly";
    }  
}