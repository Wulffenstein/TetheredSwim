import Toybox.WatchUi;
import Toybox.Lang;

class NumberPickerDelegate extends WatchUi.PickerDelegate 
{
    var swimTypeId as Number;

    public function initialize(_swimTypeId as Number) 
    {
        PickerDelegate.initialize();

        swimTypeId = _swimTypeId;
    }

    public function onCancel() as Boolean 
    {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

    public function onAccept(values as Array<Number?>) as Boolean 
    {
        var seconds = values[0] * 60 + values[2] * 10 + values[3];
        
        self.storeSelectedValue(seconds);

        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

    protected function storeSelectedValue(_seconds as Number)
    {
        throw new Lang.Exception("Missing override");
    }
}