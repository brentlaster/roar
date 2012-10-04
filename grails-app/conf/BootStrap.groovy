import grails.util.GrailsUtil
import roar.Entry

class BootStrap {

    def init = { servletContext ->
		switch(GrailsUtil.environment) {
			case "development":
			 def entry = Entry.findByAgentName("Perry")
			 if(!entry) {
			// new Entry(
			//	 agentName:"Perry",
			//	 agentType:"platypus",
			//	 advName:"Heinz Doofenschmirtz",
			//	 advTech:"inator",
			//	 serviceStart: new Date("1/01/2012"),
			//	 serviceLast: new Date("1/01/2012")
			//	 ).save(failOnError: true)
			 }
			break
			case "production":
			break
		}
    }
    def destroy = {
		switch(GrailsUtil.environment) {
			case "development":
				Entry.findByAgentName("Perry").delete()
			break;
			case "production":
			break;
		}
    }
}
