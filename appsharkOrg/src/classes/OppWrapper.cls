global class OppWrapper
{
	public Boolean isSelected {get;set;}
	public Opportunity oppObj{get;set;}        
    public Integer cnt{get;set;}
    public OppWrapper(Opportunity oppObj, Boolean isSelected, Integer cnt)
    {
        this.oppObj= oppObj;
        this.isSelected= isSelected;
        this.cnt = cnt;
    }
    
}