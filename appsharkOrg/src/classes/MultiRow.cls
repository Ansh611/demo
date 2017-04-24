public class MultiRow {
	public List<multiRowContact> Contacts { get; set; }
 
	public MultiRow() {
		LoadData();        
	}
 
	public PageReference Save() {
		for (multiRowContact MRC : Contacts) {
			MRC.Save();
		}
		LoadData();
		return null;
	}
	private void LoadData() {
		Contacts = new List<multiRowContact>();
		for (List<Contact> cs : [SELECT c.ID, c.Name, c.Email FROM Contact c]) {
			for (Contact c : cs) {
				multiRowContact MRC = new multiRowContact();
				MRC.ID = c.ID;
				MRC.Checked = false;
				MRC.Name = c.Name;
				MRC.Email = c.Email;
				Contacts.add(MRC);
			}
		}
	}
 
	private class multiRowContact {
		public String ID { get; set; }
		public String Name { get; set; }
		public String Email { get; set; }
		public Boolean Checked { get; set; }
		public void Save() {
			if (Checked) {
				System.debug('Saving...ID: ' + ID);
				Contact c = [SELECT c.Email FROM Contact c WHERE c.ID = :ID LIMIT 1];
				c.Email = Email;
				update c;
			}
		}
	}
}