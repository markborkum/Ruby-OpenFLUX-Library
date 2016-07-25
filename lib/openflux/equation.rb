module OpenFLUX # :nodoc:
  class Equation # :nodoc:
    attr_accessor :reagent_names, :product_names

    # Default constructor
    #
    # @param reagent_names [Array<#to_s>]
    # @param product_names [Array<#to_s>]
    # @return [OpenFLUX::Equation]
    def initialize(reagent_names = [], product_names = [])
      @reagent_names, @product_names = reagent_names, product_names
    end

    # Returns a formatted equation
    #
    # @param separator [#to_s]
    # @param equality [#to_s]
    # @return [String]
    def format(separator = " + ", equality = " = ")
      return nil if reagent_names.empty? && product_names.empty?
      
      [
        reagent_names.collect(&:to_s).join(separator.to_s),
        product_names.collect(&:to_s).join(separator.to_s),
      ].join(equality.to_s)
    end

    # Returns a new equation, with the reagents and products swapped
    #
    # @return [OpenFLUX::Equation]
    def swap
      self.class.new(product_names, reagent_names)
    end

    def to_s # :nodoc:
      format
    end
  end
end
