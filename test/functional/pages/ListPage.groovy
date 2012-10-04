package pages

import geb.Module

class ListPage extends ScaffoldPage {
	static url = "entry/list"
	
	static at = {
		title ==~ /Animal Responder List/
	}
	
	static content = {
		newAgentButton(to: CreatePage) { $("a", text: "New Animal Responder") }
		agentTable { $("div.content table", 0) }
		agentRow { module AgentRow, agentRows[it] }
		agentRows(required: false) { agentTable.find("tbody").find("tr") }
	}
}

class AgentRow extends Module {
	static content = {
		cell { $("td", it) }
		cellText { cell(it).text() }
        cellHrefText{ cell(it).find('a').text() }
		agentName { cellText(0) }
		agentType { cellText(1) }
		advName { cellText(2) }
		advTech { cellText(3) }
		serviceStart { cellText(4) }
		serviceLast {cellText(5) }
		showLink(to: ShowPage) { cell(0).find("a") }
	}
}