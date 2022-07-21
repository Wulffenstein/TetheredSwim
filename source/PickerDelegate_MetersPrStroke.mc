import Toybox.WatchUi;

class PickerDelegate_MetersPrStroke extends PickerDelegateBase
{
    public function initialize(_swimTypeId as Number) 
    {
        PickerDelegateBase.initialize(_swimTypeId);
    }

    protected function storeSelectedValue(_value as Object)
    {
        var meters = _value as Float;
        var dataStorage = new DataStorage();
        dataStorage.setMetersPrStroke(self.getSwimTypeId(), meters); 
    }

    protected function createCombinedValue(values as Array<Number?>) as Object
    {
        var meters = values[0].toFloat();
        var cm = (values[2] * 10 + values[3]) /  100.0;

        return meters + cm as Float;
    }
}