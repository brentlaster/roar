package roar

class Entry {

    static constraints = {
		agentName blank: false, nullable: false, unique: true, size: 1..25
		agentType blank: false, nullable: false, size: 1..25
		advName blank: false, nullable: false, size: 1..25
		advTech blank: false, nullable: false, size: 1..50
		serviceStart max: new Date()
		serviceLast max: new Date()
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
