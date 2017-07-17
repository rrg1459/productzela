class Vigente < ApplicationRecord
	  validates_numericality_of :dias,
	  :greater_than_or_equal_to => 1, 
	  :less_than_or_equal_to    => 7, :message => "La vigencia del carrito es entre 1 y 7 dias"

end
