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

java_import 'com.hp.hpl.jena.vocabulary.RDFS'
java_import 'com.hp.hpl.jena.rdf.model.ModelFactory'

#Creating a model 
m = ModelFactory.create_default_model
r = m.create_resource

r.add_property(RDFS::label, m.create_literal("chat", "en"))
r.add_property(RDFS::label, m.create_literal("chat", "fr"))
r.add_property(RDFS::label, m.create_literal("<em>chat</em>", "en"))
m.write(java.lang.System::out, "N-TRIPLE")


m = ModelFactory.create_default_model
r = m.create_resource
r.add_property(RDFS::label, "11")
r.add_literal(RDFS::label, 11)
m.write(java.lang.System::out, "N-TRIPLE")




