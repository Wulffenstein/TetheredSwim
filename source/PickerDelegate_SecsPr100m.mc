import Toybox.WatchUi;

class PickerDelegate_SecsPr100m extends PickerDelegateBase
{
    public function initialize(_swimTypeId as Number) 
    {
        PickerDelegateBase.initialize(_swimTypeId);
    }

    protected function storeSelectedValue(_value as Object)
    {
        var seconds = _value as Number;
        var dataStorage = new DataStorage();
        dataStorage.setSecsPr100m(self.getSwimTypeId(), seconds); 
    }

    protected function createCombinedValue(values as Array<Number?>) as Object
    {
        var seconds = values[0] * 60 + values[2] * 10 + values[3];

        return seconds as Number;
    }
}