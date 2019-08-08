public class NewCaseListController {

    public List<Case> getNewCases(){        
        return Database.query('SELECT id, CaseNumber FROM Case WHERE status = \'' + 'New' + '\' ');
    }
}