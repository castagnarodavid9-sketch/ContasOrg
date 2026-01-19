require 'date'

class CalculosSistema
  def self.gera_cmpt(data)
    return "" unless data.present?

  Date.strptime(data.to_s, "%Y-%m-%d").strftime("%Y%m") 
  end

  def self.adiciona_mes_a_cmpt(cmpt, meses)
    ano = cmpt[0,4].to_i
    mes = cmpt[4,2].to_i

    data = Date.new(ano, mes, 1)
    data = data >> meses
    
    puts "Mes #{mes} e ano #{ano}"

    data.strftime("%Y%m")
  end
end

