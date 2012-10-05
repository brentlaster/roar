package roar

import grails.test.mixin.TestFor
import spock.lang.Unroll

@TestFor(Entry)
class AnimalResponderSpec extends ConstraintUnitSpec {
	
	def propertyMissing(String name) { Entry[name] }

    def setup() {
        //mock an entry with some data (put unique violations in here so they can be tested, the others aren't needed)
        mockForConstraintsTests(Entry, [new Entry(agentName: 'Road Runner', agentType: 'bird', advName: 'Wile E. Coyote', advTech: 'ACME product du jour')])
    }

    @Unroll ("test entry controller all constraints #field is #error")
    def "test animal responder entry all constraints"() {
        when:
        def obj = new Entry("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error | field | val
        'size' | 'agentName' | getLongString(26)
        'nullable' | 'agentName' | null
        'size' | 'agentType' | getLongString(26)
        'nullable' | 'agentType' | null
        'size' | 'advName' | getLongString(26)
        'nullable' | 'advName' | null
		'size' | 'advTech' | getLongString(51)
		'max' | 'serviceStart' | new Date() + 1
		'max' | 'serviceLast' | new Date() + 1
     }

	@Unroll("entry #field is #error using #val")
	def "test animal responder name constraints"() {
		when:
		def obj = new Entry("$field": val)

		then:
		validateConstraints(obj, field, error)

		where:
		error | field | val
		'nullable' | 'agentName' | null
	}
  

    
    @Unroll("entry #field is #error using #val")
    def "test animal responder service start date constraints"() {
        when:
        def obj = new Entry("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error | field | val
        'max' | 'serviceStart' | new Date() + 1
        'nullable' | 'serviceStart' | null
        'valid' | 'serviceStart' | new Date() - 1
        'valid' | 'serviceStart' | new Date()
    }
	
	@Unroll("entry #field is #error using #val")
	def "test animal responder service last service date constraints"() {
		when:
		def obj = new Entry("$field": val)

		then:
		validateConstraints(obj, field, error)

		where:
		error | field | val
		'max' | 'serviceLast' | new Date() + 1
		'nullable' | 'serviceLast' | null
		'valid' | 'serviceLast' | new Date() - 1
		'valid' | 'serviceLast' | new Date()
	}

}