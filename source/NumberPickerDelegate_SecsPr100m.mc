import Toybox.WatchUi;

class NumberPickerDelegate_SecsPr100m extends NumberPickerDelegate
{
    public function initialize(_swimTypeId as Number) 
    {
        NumberPickerDelegate.initialize(_swimTypeId);
    }

    protected function storeSelectedValue(_seconds as Number)
    {
        var dataStorage = new DataStorage();
        dataStorage.setSecsPr100m(swimTypeId, _seconds); 
    }
}