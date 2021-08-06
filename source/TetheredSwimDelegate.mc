import Toybox.Lang;
import Toybox.WatchUi;

class TetheredSwimDelegate extends WatchUi.BehaviorDelegate {

    private var swimView as TetheredSwimView;
   
    function initialize(_view as TetheredSwimView) {
        BehaviorDelegate.initialize();
        swimView = _view;
    }

    public function onMenu() as Boolean {
        System.println("Menu");
        WatchUi.pushView(new Rez.Menus.settingsMenu(), new TetheredSwimMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    public function onSelect() as Lang.Boolean
    {
        if (Toybox has :ActivityRecording) 
        {
            if (swimView.isSessionRecording())
            {
                swimView.stopRecording();
            }
            else 
            {
                swimView.startRecording();
            }
        }
        return true;
    }

}