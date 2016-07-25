module OpenFLUX # :nodoc:
  class OpenFLUXError < StandardError # :nodoc:
  end

  class CarbonAtomTransitionEquationDuplicateAtomAssignment < OpenFLUXError # :nodoc:
  end

  class CarbonAtomTransitionEquationTooLarge < OpenFLUXError # :nodoc:
  end

  class CarbonAtomTransitionEquationUnbalanced < OpenFLUXError # :nodoc:
  end

  class CarbonAtomTransitionEquationAtomNotFound < OpenFLUXError # :nodoc:
  end
end
