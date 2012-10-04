package roar

import spock.lang.Specification

abstract class ConstraintUnitSpec extends Specification {
    
	String getLongString(Integer length) {
        def longString = ""
        length.times { longString += "z" }
        longString
    }

    String getEmail(Boolean valid) {
        valid ? "bob@abc.com" : "bob@a"
    }

    String getUrl(Boolean valid) {
        valid ? "http://www.google.com" : "http:/ww.gogcom"
    }

    
    void validateConstraints(obj, field, error) {
        def validated = obj.validate()
        if (error && error != 'valid') {
            assert !validated
            assert obj.errors[field]
            assert error == obj.errors[field]
        } else {
            assert !obj.errors[field]
        }
    }
}
