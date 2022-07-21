<<<<<<< HEAD
import Toybox.Lang;
import Toybox.System;

class Util
{
    private static const hourSeconds = 60 * 60;
    private static const minSeconds = 60;
    
    public static function formatTime(_time as Number) as String
    {
        if (_time != null)
        {
            _time = _time / 1000;
            var hours = _time / hourSeconds;
            _time = _time - (hours * hourSeconds);
            var mins = _time / minSeconds;
            _time = _time - (mins * minSeconds);
            var secs = _time;
            
            var timeStr = Lang.format("$1$:$2$:$3$", [hours,mins.format("%02d"),secs.format("%02d")]);

            return timeStr;
        }

        return "N/A";
    } 

    public static function formatDistance(_dist as Float) as String
    {
        if (_dist != null)
        {

            return _dist.format("%.2f");
        }

        return "N/A";
    }
=======
import Toybox.Lang;
import Toybox.System;

class Util
{
    private static const hourSeconds = 60 * 60;
    private static const minSeconds = 60;
    
    public static function formatTime(_time as Number) as String
    {
        if (_time != null)
        {
            _time = _time / 1000;
            var hours = _time / hourSeconds;
            _time = _time - (hours * hourSeconds);
            var mins = _time / minSeconds;
            _time = _time - (mins * minSeconds);
            var secs = _time;
            
            var timeStr = Lang.format("$1$:$2$:$3$", [hours,mins.format("%02d"),secs.format("%02d")]);

            return timeStr;
        }

        return "N/A";
    } 

    public static function formatDistance(_dist as Float) as String
    {
        if (_dist != null)
        {

            return _dist.format("%.2f");
        }

        return "N/A";
    }
>>>>>>> 5e1c8a5d4c2d60f2a75185a730b79a008fde1f7d
}