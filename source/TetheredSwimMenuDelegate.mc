import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;

class TetheredSwimMenuDelegate extends WatchUi.MenuInputDelegate {

    var swimActivityController as SwimActivityController;

    function initialize(_swimActivityController as SwimActivityController) 
    {
        MenuInputDelegate.initialize();

        swimActivityController = _swimActivityController;
    }

    function onMenuItem(item as Symbol) as Void 
    {
        switch (item)
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
                WatchUi.pushView(new Rez.Menus.swimTypeMenu(), new TetheredSwimMenuDelegate(swimActivityController), WatchUi.SLIDE_UP);
                break;
            case :item_secs_pr_100m:
                self.createSecsPr100mPicker();
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

    private function createAutoLapPicker() as Void
    {
        var dataStorage = new DataStorage();
        var swimType = swimActivityController.getSwimType();
        var seconds = dataStorage.getAutoLap(swimType.swimStrokeType()) as Number;
        WatchUi.pushView(new NumberPicker("m:ss / lap",seconds), new NumberPickerDelegate_AutoLap(swimType.swimStrokeType()), WatchUi.SLIDE_IMMEDIATE);
    }

    private function createSecsPr100mPicker() as Void
    {
        var dataStorage = new DataStorage() as DataStorage;
        var swimType = swimActivityController.getSwimType();
        var seconds = dataStorage.getSecsPr100m(swimType.swimStrokeType());
        WatchUi.pushView(new NumberPicker("m:ss / 100m",seconds), new NumberPickerDelegate_SecsPr100m(swimType.swimStrokeType()), WatchUi.SLIDE_IMMEDIATE);
    }
}