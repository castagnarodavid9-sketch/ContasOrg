require 'date'

class CalculosSistema
  def self.gera_cmpt(data)
    return "" unless data.present?

  Date.strptime(data.to_s, "%Y-%m-%d").strftime("%Y%m") 
  end
end

