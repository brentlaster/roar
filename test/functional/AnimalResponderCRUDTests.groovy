import geb.junit4.GebReportingTest

import pages.*
import org.junit.Test

class AnimalResponderCRUDTests extends GebReportingTest {

	@Test
	void doSomeCrud() {
		to ListPage
		assert agentRows.size() == 0
		newAgentButton.click()
		
		assert at(CreatePage)
		
		agentName = "Bugs"
		agentType = "Bunny"
		advName = "Marvin Martian"
		advTech = "PU-38 Explosive Space Modulator"
		createButton.click()
		
		assert at(ShowPage)
		
		assert agentName == "Bugs"
		assert agentType == "Bunny"
		assert advName == "Marvin Martian"
		assert advTech == "PU-38 Explosive Space Modulator"
		editButton.click()
		
		assert at(EditPage)
		agentType = "Rabbit"
		
		updateButton.click()
		
		assert at(ShowPage)
		
		to ListPage
		assert agentRows.size() == 1
		def row = agentRow(0)
		assert row.agentName == "Bugs"
		assert row.agentType == "Rabbit"
		assert row.advName == "Marvin Martian"
		assert row.advTech == "PU-38 Explosive Space Modulator"
		row.showLink.click()
		
		assert at(ShowPage)
		def deletedId = id
		withConfirm { deleteButton.click() }
		
		assert at(ListPage)
		assert message == "Entry $deletedId deleted"
		assert agentRows.size() == 0
	}
}