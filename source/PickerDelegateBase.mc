import Toybox.WatchUi;
import Toybox.Lang;

class PickerDelegateBase extends WatchUi.PickerDelegate 
{
    private var swimTypeId as Number;

    public function initialize(_swimTypeId as Number) 
    {
        PickerDelegate.initialize();

        swimTypeId = _swimTypeId;
    }

    public function onCancel() as Boolean 
    {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

    public function onAccept(values as Array<Number?>) as Boolean 
    {
        var value = self.createCombinedValue(values) as Number;
        
        self.storeSelectedValue(value);

        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

    protected function storeSelectedValue(_value as Object)
    {
        throw new Lang.Exception("Missing override");
    }

    protected function createCombinedValue(values as Array<Number?>) as Object
    {
        throw new Lang.Exception("Missing override");
    }

    protected function getSwimTypeId() as Number
    {
        return swimTypeId;
    }
}