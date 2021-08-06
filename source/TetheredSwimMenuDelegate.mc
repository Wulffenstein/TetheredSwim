import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class TetheredSwimMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        
        switch (item)
        {
            case :item_freestyle:
            case :item_breast_stroke:
            case :item_back_stroke:
            case :item_butterfly:
                //TODO: create appropriate swim count object
                break;
            case :item_auto_lap:
                //TODO: push time selector view
                break;
            case :item_swim_type: 
                WatchUi.pushView(new Rez.Menus.swimTypeMenu(), new TetheredSwimMenuDelegate(), WatchUi.SLIDE_UP);
                break;
            default: throw new Lang.Exception("Unknown item");
        }
    }

}