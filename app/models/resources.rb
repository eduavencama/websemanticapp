class Resource
    include Tripod::Resource
    field :label, RDF::RDFS.label

    # notice also that you don't need to supply an rdf type or graph here!
end
