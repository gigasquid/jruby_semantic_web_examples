require 'javalib/jena-2.6.4.jar'
require 'javalib/arq-2.8.8.jar'
require 'javalib/icu4j-3.4.4.jar'
require 'javalib/iri-0.8.jar'
require 'javalib/log4j-1.2.13.jar'
require 'javalib/slf4j-api-1.5.8.jar'
require 'javalib/slf4j-log4j12-1.5.8.jar'
require 'javalib/xercesImpl-2.7.1.jar'
require 'java'

java_import 'com.hp.hpl.jena.query.QueryFactory'
java_import 'com.hp.hpl.jena.query.QueryExecutionFactory'

#Querying Dbpedia with GEO information
#Places nearby to the White House
query = %q(
PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?subject ?label ?lat ?long WHERE {
<http://dbpedia.org/resource/White_House> geo:lat ?whLat.
<http://dbpedia.org/resource/White_House> geo:long ?whLong.
?subject geo:lat ?lat.
?subject geo:long ?long.
?subject rdfs:label ?label.
FILTER(?lat - ?whLat <= 0.05 && ?whLat - ?lat <= 0.05 &&
?long - ?whLong <= 0.05 && ?whLong - ?long <= 0.05 &&
lang(?label) = "en"
).
} LIMIT 20)

#creating query object
query = QueryFactory.create(query)
qexec = QueryExecutionFactory.sparql_service("http://dbpedia.org/sparql", query)

results = qexec.exec_select
while results.has_next
  result = results.next
  place = result.get("subject").uri
  label = result.get("label").string
  latitude =  result.get("lat").string
  longitude = result.get("long").string
  puts "#{place} #{label} lat:#{latitude} long:#{longitude}"  
end
qexec.close





