Gem::Specification.new do |s|
  s.name        = "openflux"
  s.version     = "0.0.0"
  s.date        = "2016-07-25"
  s.summary     = "OpenFLUX"
  s.description = "A Ruby interface for generating OpenFLUX metabolite balance models"
  s.authors     = ["Mark Borkum"]
  s.email       = "mark.borkum@pnnl.gov"
  s.files       = ["lib/openflux.rb", "lib/openflux/carbon_atom_transition_equation.rb", "lib/openflux/equation.rb", "lib/openflux/errors.rb", "lib/openflux/metabolite_balance_model.rb", "lib/openflux/reaction.rb"]
  s.homepage    = "https://github.com/markborkum/Ruby-OpenFLUX-Library"
  s.license     = "ECL-2.0"
end
