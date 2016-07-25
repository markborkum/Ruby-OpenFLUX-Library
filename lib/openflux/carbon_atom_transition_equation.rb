module OpenFLUX # :nodoc:
  class CarbonAtomTransitionEquation < Equation # :nodoc:
    # Dummy value for excluded metabolites (e.g., cofactors)
    #
    # @return [String]
    DUMMY_VALUE = "X".freeze

    # Atom labels
    #
    # @return [String]
    LABELS = "abcdefghijklmnopqrstuvwyzABCDEFGHIJKLMNOPQRSTUVWYZ".freeze

    def format(separator = " + ", equality = " = ") # :nodoc:
      return nil if reagent_names.collect(&:to_s).all? { |s| DUMMY_VALUE.eql?(s) } && product_names.collect(&:to_s).all? { |s| DUMMY_VALUE.eql?(s) }
      
      super(separator, equality)
    end

    # Returns a new equation, with the reagents and products swapped
    #
    # @raise [OpenFLUX::CarbonAtomTransitionEquationAtomNotFound]
    # @raise [OpenFLUX::CarbonAtomTransitionEquationDuplicateAtomAssignment]
    # @raise [OpenFLUX::CarbonAtomTransitionEquationTooLarge]
    # @raise [OpenFLUX::CarbonAtomTransitionEquationUnbalanced]
    # @return [OpenFLUX::CarbonAtomTransitionEquation]
    def swap
      assignments = {}
      
      new_reagent_names = product_names.collect { |s|
        if s.nil? || DUMMY_VALUE.eql?(s.to_s)
          s
        else
          s.to_s.chars.collect { |char|
            raise OpenFLUX::CarbonAtomTransitionEquationTooLarge.new("Carbon atom transition equation is too large") if assignments.size >= LABELS.size
            
            raise OpenFLUX::CarbonAtomTransitionEquationDuplicateAtomAssignment.new("Duplicate atom assignment #{char.inspect}") if assignments.key?(char)
              
            assignments[char] = LABELS[assignments.size]
          }.join
        end
      }
      
      new_product_names = reagent_names.collect { |s|
        if s.nil? || DUMMY_VALUE.eql?(s.to_s)
          s
        else
          s.to_s.chars.collect { |char|
            raise OpenFLUX::CarbonAtomTransitionEquationAtomNotFound.new("Product atom not found #{char.inspect}") unless assignments.key?(char)
            
            assignments.delete(char)
          }.join
        end
      }
      
      carbon_atom_transition_equation = self.class.new(new_reagent_names, new_product_names)
      
      raise OpenFLUX::CarbonAtomTransitionEquationUnbalanced.new("Carbon atom transition equation is unbalanced #{carbon_atom_transition_equation.to_s.inspect}") if assignments.any?
        
      carbon_atom_transition_equation
    end
  end
end
