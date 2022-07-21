<<<<<<< HEAD
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
=======
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
>>>>>>> 5e1c8a5d4c2d60f2a75185a730b79a008fde1f7d
}