require 'bigdecimal'
module FormatacoesHelper
  def formata_datas(data)
    return "" if !data.present?
    date = data.strftime("%d/%m/%Y")
    return date
  end

  def formata_moedas(valor)
    return "" if !valor.present?
    value = number_to_currency(valor, unit: "R$", separator: ",", delimiter: ".")
    return value
  end

  def remove_formato_moeda(valor)
    BigDecimal(
      valor.gsub(/[^\d,]/, "").gsub(",", ".")
    )
  end

end
