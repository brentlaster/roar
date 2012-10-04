package roar

class Entry {

    static constraints = {
		agentName()
		agentType()
		advName()
		advTech(maxSize:100)
		serviceStart()
		serviceLast()
		lastUpdated()
    }
	
	static mapping = {
		sort "agentName"
	}
	
	String agentName
	String agentType
	String advName
	String advTech
	Date serviceStart
	Date serviceLast
	Date lastUpdated
}
