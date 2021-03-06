require 'javalib/jena-2.6.4.jar'
require 'javalib/icu4j-3.4.4.jar'
require 'javalib/iri-0.8.jar'
require 'javalib/log4j-1.2.13.jar'
require 'javalib/slf4j-api-1.5.8.jar'
require 'javalib/slf4j-log4j12-1.5.8.jar'
require 'javalib/xercesImpl-2.7.1.jar'
require 'java'

java_import 'com.hp.hpl.jena.vocabulary.VCARD'
java_import 'com.hp.hpl.jena.rdf.model.ModelFactory'

#Tutorial 3 Statement attribute accessor methods
model = ModelFactory.create_default_model

#Creating a resource
person_uri = "http://somewhere/JohnSmith"
full_name = "John Smith"
given_name = "John"
family_name = "Smith"

john_smith = model.create_resource(person_uri).add_property(VCARD::FN, full_name)
name = model.create_resource()
name.add_property(VCARD::Given, given_name)
name.add_property(VCARD::Family, family_name)
john_smith.add_property(VCARD::N, name)
model.write(java.lang.System::out)

iter = model.list_statements
while iter.has_next
  stmt = iter.next_statement
  subject = stmt.get_subject
  predicate = stmt.get_predicate
  object = stmt.get_object
  puts "#{subject} #{predicate} #{object}"
end




