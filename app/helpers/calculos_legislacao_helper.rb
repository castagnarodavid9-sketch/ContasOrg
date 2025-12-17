module CalculosLegislacaoHelper
  def calcula_salario_liquido(salario_bruto)
    return "Nenhum valor informado!" unless salario_bruto.present?
    retorno = 0

    if salario_bruto <= 1518
      puts "Paga 7,5%"
      retorno = salario_bruto - (salario_bruto * 0.075)
    elsif salario_bruto <= 2793.88
      puts "Paga 9%"
      retorno = salario_bruto - (salario_bruto * 0.09)
    elsif salario_bruto <= 4190.83
      puts "Paga 12%"
      retorno = salario_bruto - (salario_bruto * 0.12)
    elsif salario_bruto <= 8157.41
      puts "Paga 14%"
      retorno = salario_bruto - (salario_bruto * 0.14)
    end

    return retorno
  end
end
