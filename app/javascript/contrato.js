import { formataMoeda } from "utils/formatacoes"

function initMoeda() {
  document.querySelectorAll("[data-moeda]").forEach((input) => {
    input.addEventListener("input", () => {
      formataMoeda(input);
    });
  });
}

document.addEventListener("turbo:load", initMoeda);
document.addEventListener("DOMContentLoaded", initMoeda);
