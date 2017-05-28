class ArtistController < ApplicationController

def index
   #@artists = Artist.where("SELECT ?label WHERE  { test:thing rdfs:label ?label  FILTER(LANG(?label) = "") }").limit(1).offset(0)
   # @artists  = Artist.where("DESCRIBE ?uri WHERE { SELECT DISTINCT ?uri (http://dbpedia.org as ?graph) WHERE { GRAPH http://dbpedia.org { ?uri a http://dbpedia.org/ontology/Book . ?uri ?p ?o } } LIMIT 5}")

    @artists = Artist.where("[] a ?label").limit(1)
    #@artists = Artist.first
end


end