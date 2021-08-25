import Toybox.WatchUi;

class NumberPickerDelegate_AutoLap extends NumberPickerDelegate
{
    public function initialize(_swimTypeId as Number) 
    {
        NumberPickerDelegate.initialize(_swimTypeId);
    }

    protected function storeSelectedValue(_seconds as Number)
    {
        var dataStorage = new DataStorage();
        dataStorage.setAutoLap(swimTypeId, _seconds);
    }

}