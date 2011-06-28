require 'javalib/jena-2.6.4.jar'
require 'javalib/arq-2.8.7.jar'
require 'javalib/icu4j-3.4.4.jar'
require 'javalib/iri-0.8.jar'
require 'javalib/log4j-1.2.13.jar'
require 'javalib/lucene-core-2.3.1.jar'
require 'javalib/slf4j-api-1.5.8.jar'
require 'javalib/slf4j-log4j12-1.5.8.jar'
require 'javalib/stax-api-1.0.1.jar'
require 'javalib/wstx-asl-3.2.9.jar'
require 'javalib/xercesImpl-2.7.1.jar'

#java_import com.hp.hpl.jena.vocabulary.VCARD


#Creating a model 
m = Java::com.hp.hpl.jena.rdf.model.ModelFactory.createDefaultModel


#Creating a resource
person_uri = "http://somewhere/JohnSmith"
full_name = "John Smith"
john_smith = m.create_resource(person_uri)
john_smith.add_property(com.hp.hpl.jena.vocabulary.VCARD::FN, fullName)



