import $ from "jquery"

export function formataMoeda(input) {
  let valor = input.value;

  // remove tudo que não for número
  valor = valor.replace(/\D/g, "");

  // evita campo vazio quebrar
  if (valor === "") {
    input.value = "";
    return;
  }

  // converte para centavos
  valor = (parseInt(valor, 10) / 100).toFixed(2);

  // formata para BRL
  input.value = Number(valor).toLocaleString("pt-BR", {
    style: "currency",
    currency: "BRL"
  });
}
