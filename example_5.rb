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
java_import 'java.io.InputStream'

#Tutorial 5 - read RDF XML from a file and write it to standard out
model = ModelFactory.create_default_model
input_file = FileManager.get.open "sample_input.rdf"
model.read(input_file, nil)
model.write(java.lang.System::out, "N-TRIPLE")




