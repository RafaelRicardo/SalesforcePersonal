global class CandidateKeyWebService {

    webService static Boolean submitEmployeeReferral(String posId, Candidate__c c) {
    	
        boolean cCreate = true;
        if (c.Email__c != null){
			String uKey = c.Last_Name__c.toLowerCase() + c.Email__c.toLowerCase();
			
			if ([select count() from Candidate__c where unique_key__c = :uKey] >= 1) {
				cCreate=false;
				// set c to be the dupe candidate so we can get the Id value of the candidate later
				c = [select Id from Candidate__c where unique_key__c = :uKey limit 1];
			}
		}
        
        boolean err = false;
        
        if (cCreate){
			try{
				insert c;
			} catch (System.DmlException e) {
				//update our err flag
				err = true;
				System.debug('error bulk inserting new candidate record');
				for (Integer k = 0; k < e.getNumDml(); k++) {
					System.debug(e.getDmlMessage(k));
				}
			}
		}
        
        if (!err){
			Job_Application__c j = new Job_Application__c();
			j.Status__c = 'Open';
			j.Stage__c = 'New';
			j.Position__c = posId;
			j.Candidate__c = c.id;

			try{
				insert j;
			} catch (System.DmlException e) {
				System.debug('error bulk inserting new job application');
				for (Integer k = 0; k < e.getNumDml(); k++) {
					// Process exception here
					System.debug(e.getDmlMessage(k));
				}
			}
		}
        
        
        if (!err) {
            return true;
        } else {
            //	further error handling here
            return false;
        }
    }
}