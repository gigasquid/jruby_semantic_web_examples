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
require 'java'

java_import 'com.hp.hpl.jena.rdf.model.ModelFactory'
java_import 'com.hp.hpl.jena.util.FileManager'
java_import 'java.io.InputStream'

#Creating a model 
m = ModelFactory.create_default_model

#Finding the input file using the Jena File Manager
input_file = FileManager.get.open "sample_input.txt"

#read the RDF/XML file
m.read(input_file, nil)

#write the RDF file out in a different format
m.write(java.lang.System::out, "N-TRIPLE")




