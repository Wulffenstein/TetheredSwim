using Toybox.Lang;
using Toybox.Activity;

class CountBase
{
    public function newFromStrokeType(_swimStrokeType as int)
    {
        switch(swimStrokeType)     
        {
            case SWIM_STROKE_BACKSTROKE: return new Count_BackStroke();
            case SWIM_STROKE_BREASTSTROKE: return new Count_BreastStroke();
            case SWIM_STROKE_BUTTERFLY: return new Count_Butterfly();
            case SWIM_STROKE_FREESTYLE: return new Count_FreeStyle();
                           

        }   
    }
    
    public function strokesPerRevolution() as int 
    {
        
        throw new Lang.Exception("Missing override");
    }

    public function swimStrokeType() as int 
    {
        throw new Lang.Exception("Missing override");
    }

    public function swimName() as String
    {
        throw new Lang.Exception("Missing override");
    }
}