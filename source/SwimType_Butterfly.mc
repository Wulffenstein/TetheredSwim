class SwimType_Butterfly extends SwimTypeBase
{
    public function initialize()
    {
        SwimTypeBase.initialize();
    } 

    public function strokeType() as int 
    {
        return Activity.SWIM_STROKE_BUTTERFLY;
    }

    public function swimName() as String
    {
        return "Butterfly";
    } 
}