import Toybox.Application.Storage;

enum SETTING_TYPE {
    SETTING_TYPE_SWIM = 0,
    SETTING_TYPE_GLOBAL = 100
}

enum SETTING_SWIM_TYPE {
    SETTING_AUTO_LAP,
    SETTING_SECS_PR_100M,
    SETTING_METERS_PR_STROKE
}

enum SETTING_GLOBAL {
    SETTING_LAST_SWIM_TYPE
}

class DataStorage
{
    public function getSwimTypeSettings(_swimType as Number) as Dictionary
    {
        var settings = Storage.getValue(SETTING_TYPE_SWIM + _swimType);

        if (settings == null)
        {
            settings = self.createEmptySwimTypeSettings();
            self.setSwimTypeSettings(_swimType, settings);
        }

        return settings;
    }

    public function setSwimTypeSettings(_swimType as Number, _settings as Dictionary) as Void
    {
        Storage.setValue(SETTING_TYPE_SWIM + _swimType, _settings);
    }

    public function getSwimTypeSetting(_swimType as Number, _settingId as Number) as Number
    {
        var settings = self.getSwimTypeSettings(_swimType);

        return settings[_settingId];
    }

    public function getAutoLap(_swimType as Number) as Number
    {
        return self.getSwimTypeSetting(_swimType,SETTING_AUTO_LAP);
    }

    public function setAutoLap(_swimType as Number, _autoLap as Number) as Void
    {
        var settings = self.getSwimTypeSettings(_swimType);
        settings[SETTING_AUTO_LAP] = _autoLap;

        self.setSwimTypeSettings(_swimType,settings);
    }

    public function getSecsPr100m(_swimType as Number) as Number
    {
        return self.getSwimTypeSetting(_swimType,SETTING_SECS_PR_100M);
    }

    public function setSecsPr100m(_swimType as Number, _secsPr100m as Number) as Void
    {
        var settings = self.getSwimTypeSettings(_swimType);
        settings[SETTING_SECS_PR_100M] = _secsPr100m;

        self.setSwimTypeSettings(_swimType,settings);
    }

    public function getMetersPrStroke(_swimType as Number) as Float
    {
        return self.getSwimTypeSetting(_swimType, SETTING_METERS_PR_STROKE);
    }

    public function setMetersPrStroke(_swimType as Number, _metersPrStroke as Float) as Void
    {
        var settings = self.getSwimTypeSettings(_swimType);
        settings[SETTING_METERS_PR_STROKE] = _metersPrStroke;

        self.setSwimTypeSettings(_swimType,settings);
    }

    public function getLastSwimType() as Number
    {
        var lastSwimType = Storage.getValue(SETTING_TYPE_GLOBAL + SETTING_LAST_SWIM_TYPE);

        if (lastSwimType == null)
        {
            lastSwimType = Activity.SWIM_STROKE_FREESTYLE;
        }

        return lastSwimType;
    }

    public function setLastSwimType(_swimType as Number) as Void
    {
        Storage.setValue(SETTING_TYPE_GLOBAL + SETTING_LAST_SWIM_TYPE, _swimType);
    }

    public function createEmptySwimTypeSettings() as Dictionary
    {
        var settings = {SETTING_AUTO_LAP => 30, SETTING_SECS_PR_100M => 90, SETTING_METERS_PR_STROKE => 1.00};

        return settings;
    }
}