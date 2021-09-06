import Toybox.Graphics;
import Toybox.WatchUi;

class TetheredSwimView extends WatchUi.View {

    private var swimActivityController as SwimActivityController;
    
    function initialize() {
        View.initialize();

        swimActivityController = new SwimActivityController(self);
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        swimActivityController.updateSwimTypeName();

        if (swimActivityController.getActivityState() == PAUSED)
        {
            swimActivityController.resumeActivity();            
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        swimActivityController.updateSwimTime();        
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void
    {

    }

    function onDelegateSelect() as Void
    {
        swimActivityController.onSelect();
    }

    public function getSwimActivityController() as SwimActivityController
    {
        return swimActivityController;
    }
}