<<<<<<< HEAD
import Toybox.WatchUi;

class NumberPickerFactory extends WatchUi.PickerFactory
{
    var start as Number;
    var end as Number;
    
    public function initialize(_start as Number, _end as Number)
    {
        PickerFactory.initialize();

        start = _start;
        end = _end;
    }

    public function getDrawable(index as Number, selected as Boolean) as Drawable? 
    {
        var text = index.toString();
        
        return new WatchUi.Text({:text=>text, :color=>Graphics.COLOR_WHITE, :font=>Graphics.FONT_NUMBER_HOT,
            :locX=>WatchUi.LAYOUT_HALIGN_CENTER, :locY=>WatchUi.LAYOUT_VALIGN_CENTER});
    }

    public function getValue(_index as Number) as Object? {
        return _index;
    }
    
    public function getSize() as Number {
        return end + 1;
    }
=======
import Toybox.WatchUi;

class NumberPickerFactory extends WatchUi.PickerFactory
{
    var start as Number;
    var end as Number;
    
    public function initialize(_start as Number, _end as Number)
    {
        PickerFactory.initialize();

        start = _start;
        end = _end;
    }

    public function getDrawable(index as Number, selected as Boolean) as Drawable? 
    {
        var text = index.toString();
        
        return new WatchUi.Text({:text=>text, :color=>Graphics.COLOR_WHITE, :font=>Graphics.FONT_NUMBER_HOT,
            :locX=>WatchUi.LAYOUT_HALIGN_CENTER, :locY=>WatchUi.LAYOUT_VALIGN_CENTER});
    }

    public function getValue(_index as Number) as Object? {
        return _index;
    }
    
    public function getSize() as Number {
        return end + 1;
    }
>>>>>>> 5e1c8a5d4c2d60f2a75185a730b79a008fde1f7d
}