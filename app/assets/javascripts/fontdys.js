function afficherPopup() {
  var confirmation = confirm(
    "Souhaitez-vous changer la police d'écriture pour faciliter la lecture en cas de dyslexie ?",
  );
  if (confirmation) {
    localStorage.setItem("dyslexicFont", "true");
    applyFontPreference();
  }
}

function applyFontPreference() {
  var isDyslexic = localStorage.getItem("dyslexicFont");
  if (isDyslexic === "true") {
    document.body.style.setProperty(
      "font-family",
      "Open-Dyslexic",
      "important",
    );
  } else {
    document.body.style.removeProperty("font-family");
  }
}

window.onload = function () {
  // Apply font preference on page load
  applyFontPreference();

  // Add event listener to the button
  document
    .getElementById("toggleFontButton")
    .addEventListener("click", function () {
      // Toggle font preference
      var isDyslexic = localStorage.getItem("dyslexicFont");
      localStorage.setItem(
        "dyslexicFont",
        isDyslexic !== "true" ? "true" : "false",
      );

      // Apply updated font preference
      applyFontPreference();
    });
};
