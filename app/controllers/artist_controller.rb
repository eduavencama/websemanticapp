class ArtistController < ApplicationController

def index

    sparql = SPARQL::Client.new("http://www.grupo1.semanticweb.uniandes.edu.co:8890/sparql")

    artist = "<http://www.grupo1.semanticweb.uniandes.edu.co/curso/arte#Artist>"
    type = '<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>'

    name = '<http://www.grupo1.semanticweb.uniandes.edu.co/curso/arte#name>'
    qname = ""
    nacionality = '<http://www.grupo1.semanticweb.uniandes.edu.co/curso/arte#nationality>'
    qnacionality = ""
    qoptinalnac = "OPTIONAL"
    movement = '<http://www.grupo1.semanticweb.uniandes.edu.co/curso/arte#movement>'
    qmovement_name = ""
    qoptinalmn = "OPTIONAL"
    offset=0
    limit=20

    if params[:name] && params[:name] != ''
      qname = ', ?name FILTER(?name="'+params[:name]+'"^^<http://www.w3.org/2001/XMLSchema#string>)'
    end
    if params[:movement_name] && params[:movement_name] != ''
      qmovement_name = ', ?movement_name FILTER(?movement_name="'+params[:movement_name]+'"^^<http://www.w3.org/2001/XMLSchema#string>)'
      qoptinalmn = ""
    end
    if params[:nacionality] && params[:nacionality] != ''
      qnacionality = ', ?nacionality FILTER(?nacionality="'+params[:nacionality]+'"^^<http://www.w3.org/2001/XMLSchema#string>)'
      qoptinalnac = ""
    end
    if params[:offset] && params[:offset] != ''
      offset = params[:offset]
    end
    if params[:limit] && params[:limit] != ''
      limit = params[:limit]
    end


    @q =    "SELECT ?uri ?name ?movement ?movement_name ?nacionality
            WHERE { ?uri #{type} #{artist} .
                ?uri  #{name} ?name #{qname} .
                #{qoptinalmn} {?uri #{movement} ?movement } .
                #{qoptinalnac} {?uri #{nacionality} ?nacionality #{qnacionality} } .
                #{qoptinalmn} {?movement #{name} ?movement_name #{qmovement_name} } .} offset #{offset} limit #{limit}"


    @query= sparql.query(@q)




end


end
