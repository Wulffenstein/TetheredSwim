class Count_FreeStyle extends CountBase
{
    function initialize()
    {
        CountBase.initialize();
    }   

    public function strokesPerRevolution() as int 
    {
        return 2;
    }

    public function accelerationAxis() as AXIS
    {
        return Z;        
    }

}