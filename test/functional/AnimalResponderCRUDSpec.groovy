import geb.spock.GebReportingSpec

import spock.lang.*

import pages.*

@Stepwise
class AnimalResponderCRUDSpec extends GebReportingSpec {
	
	def "there are no animal responders"() {
		when:
		to ListPage
		then:
		agentRows.size() == 0
	}
	
	def "add an animal responder"() {
		when:
		newAgentButton.click()
		then:
		at CreatePage
	}
	
	def "enter the details"() {
		when:
		agentName = "Bugs"
		agentType = "Bunny"
		advName = "Marvin Martian"
		advTech = "PU-38 Explosive Space Modulator"
		createButton.click()
		then:
		at ShowPage
	}
	
	def "check the entered details"() {
		expect:
		agentName == "Bugs"
		agentType == "Bunny"
		advName == "Marvin Martian"
		advTech == "PU-38 Explosive Space Modulator"
	}

	def "edit the details"() {
		when:
		editButton.click()
		then:
		at EditPage
		when:
		agentType = "Rabbit"
		updateButton.click()
		then:
		at ShowPage
	}
	
	def "check in listing"() {
		when:
		to ListPage
		then:
		agentRows.size() == 1
		def row = agentRow(0)
		row.agentName == "Bugs"
		row.agentType == "Rabbit"
		row.advName == "Marvin Martian"
		row.advTech == "PU-38 Explosive Space Modulator"		
	}
	
	def "show animal responder"() {
		when:
		agentRow(0).showLink.click()
		then:
		at ShowPage
	}
	
	def "delete animal responder"() {
		given:
		def deletedId = id
		when:
		withConfirm { deleteButton.click() }
		then:
		at ListPage
		message == "Entry $deletedId deleted"
		agentRows.size() == 0
	}
	
	
	
	@Unroll
	def "enter the details for more agents" () {
		
		where:
			aN | aT | avN | avT | count
			"Scooby" | "dog" | "fake ghosts" | "mask" | 1
			"Perry" | "Platypus" | "H. Doofensmirtz" | "inator" | 2
			"Mr. Krabs" | "Crab" | "Plankton" | "various" | 3
		
	}
}