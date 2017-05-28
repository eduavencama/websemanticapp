class Artist
  include Tripod::Resource

  # these are the default rdf-type and graph for resources of this class
  #rdf_type 'http://person'
  graph_uri 'http://dbpedia.org'

  #field :name, 'http://name'
  #field :knows, 'http://knows', :multivalued => true
 # field :aliases, 'http://alias', :multivalued => true
  #field :age, 'http://age', :datatype => RDF::XSD.integer
  field :label, RDF::RDFS.label
  #field :important_dates, 'http://importantdates', :datatype => RDF::XSD.date, :multivalued => true
end