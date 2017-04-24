global class FullDBSearch implements Database.Batchable<String>, Iterator<String>, Iterable<String>, Database.Stateful {
    string[] backlog;
    string term;
    sobject[] allresults;
    integer counter;

    global FullDBSearch(string term) {
        backlog = new string[0];
        for(sobjecttype t:schema.getglobaldescribe().values())
            if(t.getdescribe().issearchable())
                backlog.add(string.valueof(t));
        this.term = term;
        allresults = new sobject[0];
        counter = 0;
    }
    global boolean hasnext() {
        return !backlog.isempty();
    }
    global iterable<string> start(database.batchablecontext bc) {
        return this;
    }
    global iterator<string> iterator() {
        return this;
    }
    global string next() {
        return backlog.remove(0);
    }
    global void execute(database.batchablecontext bc, string[] scope) {
        while(!scope.isempty()) {
            sobject[] records = search.query('find :term in all fields returning '+scope.remove(0))[0];
            allresults.addall(records);
            counter++;
        }

    }
    global void finish(database.batchablecontext bc) {
        system.debug(logginglevel.error, allresults.size()+' records processed');
        system.debug(logginglevel.error, counter+' objects processed');
    }
}