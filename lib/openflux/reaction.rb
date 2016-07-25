module OpenFLUX
  class Reaction
    # Valid values of "rxnType"
    #
    # @return [Array<String>]
    VALID_TYPES = %w{F R FR B BR S SF}.freeze

    attr_accessor :equation, :carbon_atom_transition_equation, :type

    # Default constructor
    #
    # @param equation [OpenFLUX::Equation]
    # @param carbon_atom_transition_equation [OpenFLUX::CarbonAtomTransitionEquation]
    # @param type [String]
    # @raise [ArgumentError]
    # @return [OpenFLUX::Reaction]
    def initialize(equation, carbon_atom_transition_equation, type, &block)
      self.equation, self.carbon_atom_transition_equation, self.type = equation, carbon_atom_transition_equation, type
      
      if block_given?
        case block.arity
          when 1 then block.call(self)
          else instance_eval(&block)
        end
      end
    end

    # Writer for "rxnEq"
    #
    # @param equation [OpenFLUX::Equation]
    # @raise [ArgumentError]
    # @return [OpenFLUX::Equation]
    def equation=(equation)
      unless equation.is_a?(OpenFLUX::Equation)
        raise ArgumentError.new("Expected OpenFLUX::Equation, received #{equation.inspect}")
      end
      
      @equation = equation
    end

    # Writer for "rxnCTrans"
    #
    # @param equation [OpenFLUX::CarbonAtomTransitionEquation]
    # @raise [ArgumentError]
    # @return [OpenFLUX::CarbonAtomTransitionEquation]
    def carbon_atom_transition_equation=(carbon_atom_transition_equation)
      unless carbon_atom_transition_equation.is_a?(OpenFLUX::CarbonAtomTransitionEquation)
        raise ArgumentError.new("Expected OpenFLUX::CarbonAtomTransitionEquation, received #{carbon_atom_transition_equation.inspect}")
      end
      
      @carbon_atom_transition_equation = carbon_atom_transition_equation
    end

    # Writer for "rxnType"
    #
    # @param type [String]
    # @raise [ArgumentError]
    # @return [String]
    def type=(type)
      unless VALID_TYPES.include?(type)
        raise ArgumentError.new("Invalid rxnType #{type.inspect}")
      end
      
      @type = type
    end
  end
end
