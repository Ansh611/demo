Public class WrapperContactWrapper
{
    Public Opportunity con{get;set;}
    Public boolean bool{get;set;}
    public WrapperContactWrapper(Opportunity c,boolean bool)
    {
        this.con = c;
        this.bool = bool;
    }
}