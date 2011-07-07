require 'javalib/jena-2.6.4.jar'
require 'javalib/icu4j-3.4.4.jar'
require 'javalib/iri-0.8.jar'
require 'javalib/log4j-1.2.13.jar'
require 'javalib/slf4j-api-1.5.8.jar'
require 'javalib/slf4j-log4j12-1.5.8.jar'
require 'javalib/xercesImpl-2.7.1.jar'
require 'java'

java_import 'com.hp.hpl.jena.rdf.model.ModelFactory'
java_import 'com.hp.hpl.jena.util.FileManager'
java_import 'com.hp.hpl.jena.vocabulary.VCARD'
java_import 'java.io.InputStream'

#Tutorial navigating a model

john_smith_uri = "http://somewhere/JohnSmith/"
#Creating a model 
model = ModelFactory.create_default_model

#Finding the input file using the Jena File Manager
input_file = FileManager.get.open "sample_input.rdf"

#read the RDF/XML file
model.read(input_file, nil)

#Retreive the john_smith vcard from the model and properties
vcard = model.get_resource(john_smith_uri)
name = vcard.get_required_property(VCARD::N).get_object
full_name = vcard.get_required_property(VCARD::FN).get_string;

#Add nicknames to the vcard
vcard.add_property(VCARD::NICKNAME, "Smithy")
vcard.add_property(VCARD::NICKNAME, "Adman")

puts "The Nicknames of #{full_name} are"
iter = vcard.list_properties VCARD::NICKNAME
while iter.has_next
  puts iter.next_statement.get_object.to_s
end







