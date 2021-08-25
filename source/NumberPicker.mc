import Toybox.WatchUi;

class NumberPicker extends WatchUi.Picker 
{
    public function initialize(_numberPickerTitle as String, _defaultSeconds as Number)
    {
        var title = new WatchUi.Text({:text=>_numberPickerTitle, :locX=>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_BOTTOM, :color=>Graphics.COLOR_WHITE});
        
        var factories = new Array<NumberPickerFactory or Text>[4];
        factories[0] = new NumberPickerFactory(0,9);
        factories[1] = new WatchUi.Text({:text=>$.Rez.Strings.timeSeparator, :font=>Graphics.FONT_MEDIUM, :locX=>WatchUi.LAYOUT_HALIGN_CENTER, 
                                         :locY=>WatchUi.LAYOUT_VALIGN_CENTER, :color=>Graphics.COLOR_WHITE});
        factories[2] = new NumberPickerFactory(0,5);
        factories[3] = new NumberPickerFactory(0,9);

        var defaults = new Array<Number>[factories.size()];
        var minutes = _defaultSeconds / 60;
        var seconds = _defaultSeconds - (minutes * 60);
        defaults[0] = minutes;
        defaults[2] = seconds / 10;
        defaults[3] = seconds % 10;
        
        Picker.initialize({:title=>title, :pattern=>factories, :defaults=>defaults});       
    }

    public function onUpdate(dc as Dc) as Void 
    {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        Picker.onUpdate(dc);
    }
}