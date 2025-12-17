require 'date'

class CalculosSistema
  def self.gera_cmpt(data)
    return "" unless data.present?

    Date.strptime(data, "%Y-%m-%d").strftime("%Y%m")
  end
end

