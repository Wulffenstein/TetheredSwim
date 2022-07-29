import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;

class TetheredSwimMenuDelegate extends WatchUi.Menu2InputDelegate {

    var swimActivityController as SwimActivityController;

    function initialize(_swimActivityController as SwimActivityController) 
    {
        Menu2InputDelegate.initialize();

        swimActivityController = _swimActivityController;
    }

    public function onSelect(item as MenuItem) as Void 
    {
        var id = item.getId();
    
        switch (id)
        {
            case :item_freestyle:
                swimActivityController.setSwimType(new SwimType_Freestyle());
                break;
            case :item_breast_stroke:
                swimActivityController.setSwimType(new SwimType_Breaststroke());
                break;
            case :item_back_stroke:
                swimActivityController.setSwimType(new SwimType_Backstroke());
                break;
            case :item_butterfly:
                swimActivityController.setSwimType(new SwimType_Butterfly());
                break;
            case :item_auto_lap:
                self.createAutoLapPicker();
                break;
            case :item_swim_type: 
                WatchUi.pushView(UtilMenus.createSwimTypeMenu(), new TetheredSwimMenuDelegate(swimActivityController), WatchUi.SLIDE_UP);
                break;
            case :item_secs_pr_100m:
                self.createSecsPr100mPicker();
                break;
            case :item_meters_pr_stroke:
                self.createMetersPrStrokePicker();
                break;
            case :item_save:
                swimActivityController.stopActivity();
                break;
            case :item_continue:
                swimActivityController.resumeActivity();
                break;
            case :item_discard:
                swimActivityController.discardActivity();
                break;
            default: throw new Lang.Exception("Unknown item");
        }
    }

    public function onBack() as Void 
    {
        WatchUi.popView(WatchUi.SLIDE_DOWN);

        if (swimActivityController.getActivityState() == PAUSED)
        {
            swimActivityController.resumeActivity();            
        }
    }

    private function createAutoLapPicker() as Void
    {
        var dataStorage = new DataStorage();
        var swimType = swimActivityController.getSwimType();
        var seconds = dataStorage.getAutoLap(swimType.strokeType()) as Number;
        WatchUi.pushView(new Picker_Time("m:ss / lap",seconds), new PickerDelegate_AutoLap(swimType.strokeType()), WatchUi.SLIDE_IMMEDIATE);
    }

    private function createSecsPr100mPicker() as Void
    {
        var dataStorage = new DataStorage() as DataStorage;
        var swimType = swimActivityController.getSwimType();
        var seconds = dataStorage.getSecsPr100m(swimType.strokeType());
        WatchUi.pushView(new Picker_Time("m:ss / 100m",seconds), new PickerDelegate_SecsPr100m(swimType.strokeType()), WatchUi.SLIDE_IMMEDIATE);
    }

    private function createMetersPrStrokePicker() as Void
    {
        var dataStorage = new DataStorage() as DataStorage;
        var swimType = swimActivityController.getSwimType();
        var meters = dataStorage.getMetersPrStroke(swimType.strokeType());
        WatchUi.pushView(new Picker_Distance("m / stroke",meters), new PickerDelegate_MetersPrStroke(swimType.strokeType()), WatchUi.SLIDE_IMMEDIATE);
    }
}