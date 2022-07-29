import Toybox.WatchUi;

class UtilMenus
{
    public static function createSettingsMenu(_swimView as TetheredSwimView) as Menu2
    {
        var controller = _swimView.getSwimActivityController() as SwimActivityController;
        var swimType = controller.getSwimType() as SwimType;
        var dataStorage = new DataStorage() as DataStorage;
        
        var menu = new WatchUi.Menu2({:title=>"Settings"});

        menu.addItem(new WatchUi.MenuItem("Swim type", swimType.swimName(), :item_swim_type, null));
        menu.addItem(new WatchUi.MenuItem("Auto lap", Util.formatTime(dataStorage.getAutoLap(swimType.strokeType()) * 1000), :item_auto_lap, null));
        menu.addItem(new WatchUi.MenuItem("Time / 100m", Util.formatTime(dataStorage.getSecsPr100m(swimType.strokeType()) * 1000), :item_secs_pr_100m, null));
        menu.addItem(new WatchUi.MenuItem("m / stroke", Util.formatDistance(dataStorage.getMetersPrStroke(swimType.strokeType())), :item_meters_pr_stroke, null));

        return menu;
    }  

    public static function createSwimTypeMenu() as WatchUI.Menu2
    {
        var menu = new WatchUi.Menu2({:title=>"Swim type"});

        menu.addItem(new WatchUi.MenuItem("Freestyle", null, :item_freestyle, null));
        menu.addItem(new WatchUi.MenuItem("Breaststroke", null, :item_breast_stroke, null));
        menu.addItem(new WatchUi.MenuItem("Backstroke", null, :item_back_stroke, null));
        menu.addItem(new WatchUi.MenuItem("Butterfly", null, :item_butterfly, null));

        return menu;   
    } 

    public static function createPauseMenu() as WatchUI.Menu2
    {
        var menu = new WatchUi.Menu2({:title=>"Paused"});

        menu.addItem(new WatchUi.MenuItem("Continue", null, :item_continue, null));
        menu.addItem(new WatchUi.MenuItem("Save", null, :item_save, null));
        menu.addItem(new WatchUi.MenuItem("Discard", null, :item_discard, null));

        return menu;    
    }
}