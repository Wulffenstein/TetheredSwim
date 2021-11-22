import Toybox.Lang;
import Toybox.WatchUi;

class TetheredSwimDelegate extends WatchUi.BehaviorDelegate {

    private var swimView as TetheredSwimView;
   
    function initialize(_view as TetheredSwimView) {
        BehaviorDelegate.initialize();
        swimView = _view;
    }

    public function onMenu() as Boolean {
        var controller = swimView.getSwimActivityController() as SwimActivityController;
        //controller.updateSwimTypeName();
        if (controller.getActivityState() == INITIAL)
        {
            WatchUi.pushView(UtilMenus.createSettingsMenu(swimView), new TetheredSwimMenuDelegate(controller), WatchUi.SLIDE_UP);
        }
        return true;
    }

    public function onSelect() as Lang.Boolean
    {
        swimView.onDelegateSelect();

        return true;
    }
}