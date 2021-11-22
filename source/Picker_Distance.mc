import Toybox.WatchUi;

class Picker_Distance extends PickerBase 
{
    public function initialize(_pickerTitle as String, _defaultDistance as Float)
    {
        var title = new WatchUi.Text({:text=>_pickerTitle, :locX=>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_BOTTOM, :color=>Graphics.COLOR_WHITE});
        
        var factories = new Array<NumberPickerFactory or Text>[4];
        factories[0] = new NumberPickerFactory(0,9);
        factories[1] = new WatchUi.Text({:text=>$.Rez.Strings.distanceSeparator, :font=>Graphics.FONT_MEDIUM, :locX=>WatchUi.LAYOUT_HALIGN_CENTER, 
                                         :locY=>WatchUi.LAYOUT_VALIGN_CENTER, :color=>Graphics.COLOR_WHITE});
        factories[2] = new NumberPickerFactory(0,9);
        factories[3] = new NumberPickerFactory(0,9);

        var defaults = new Array<Number>[factories.size()];
        var meters = Math.floor(_defaultDistance);
        var cm = Math.round((_defaultDistance - meters) * 100).toNumber();
        defaults[0] = meters;
        defaults[2] = cm / 10;
        defaults[3] = cm % 10;
        
        PickerBase.initialize({:title=>title, :pattern=>factories, :defaults=>defaults});       
    }
}