class CalculosLegislacao
  def self.calcula_salario_liquido(salario_bruto)
    return nil unless salario_bruto.present?

    desconto = 0

    if salario_bruto > 0
      faixa = [salario_bruto, 1518].min
      desconto += faixa * 0.075
    end

    if salario_bruto > 1518
      faixa = [salario_bruto - 1518, 2793.88 - 1518].min
      desconto += faixa * 0.09
    end

    if salario_bruto > 2793.88
      faixa = [salario_bruto - 2793.88, 4190.83 - 2793.88].min
      desconto += faixa * 0.12
    end

    if salario_bruto > 4190.83
      faixa = [salario_bruto - 4190.83, 8157.41 - 4190.83].min
      desconto += faixa * 0.14
    end

    salario_bruto - desconto
  end
end
