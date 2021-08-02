using Toybox.Lang;

class CountBase
{
    public function strokesPerRevolution() as int {
        
        throw new Lang.Exception("Missing override");
    }

    public function swimStrokeType() as int {
        throw new Lang.Exception("Missing override");
    }
}