import Toybox.WatchUi;
import Toybox.Lang;

class PickerBase extends WatchUi.Picker 
{
    public function initialize(_settings as Dictionary)
    {
        Picker.initialize(_settings);
    }

    public function onUpdate(dc as Dc) as Void 
    {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        Picker.onUpdate(dc);
    }
}