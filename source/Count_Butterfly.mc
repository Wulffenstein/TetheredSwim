class Count_Butterfly extends CountBase
{
    function initialize()
    {
        CountBase.initialize();
    }   

    public function strokesPerRevolution() as int 
    {
        return 1;
    }

    public function accelerationAxis() as AXIS
    {
        return Z;        
    } 

}