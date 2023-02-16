// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";
import "chartkick/chart.js";

document.addEventListener("DOMContentLoaded", function () {
  const propertySelect = document.querySelector("#property-select");

  propertySelect.addEventListener("change", function () {
    const selectedPropertyId = this.value;
    if (selectedPropertyId) {
      window.location.href = "/properties/" + selectedPropertyId;
    }
  });
});
