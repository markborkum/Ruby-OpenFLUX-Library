require "csv"

module OpenFLUX # :nodoc:
  class MetaboliteBalanceModel # :nodoc:
    attr_accessor :reactions

    # Default constructor
    #
    # @param reactions [Array<OpenFLUX::Reaction>]
    # @return [OpenFLUX::MetaboliteBalanceModel]
    # @yieldparam metabolite_balance_model [OpenFLUX::MetaboliteBalanceModel]
    def initialize(reactions = [], &block)
      @reactions = reactions
      
      if block_given?
        case block.arity
          when 1 then block.call(self)
          else instance_eval(&block)
        end
      end
    end

    # Returns a CSV representation of this object
    #
    # @param data [IO]
    # @return [CSV]
    def to_csv(data)
      CSV.instance(data, force_quotes: true, headers: true) do |csv|
        csv << %w{rxnID rxnEq rxnCTrans rates rxnType basis deviation}
        
        reactions.each_with_index do |reaction, index|
          csv << ["R#{index + 1}", reaction.equation.to_s, reaction.carbon_atom_transition_equation.to_s, nil, reaction.type.to_s, nil, nil]
        end
      end
    end
  end
end
