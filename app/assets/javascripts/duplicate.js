document.addEventListener("DOMContentLoaded", function () {
  let duplicate = document.getElementById("duplicate-1"),
    Parent = duplicate.parentNode,
    BtDuplicate = document.getElementById("bt-duplicate");

  BtDuplicate.onclick = (event) => {
    // only take the logic of add or delete div
    event.preventDefault();

    let count = document.querySelectorAll(".duplid").length;
    let nextId = count + 1;

    // Set dynamic id
    let Clone = duplicate.cloneNode(true);
    Clone.id = "duplicate-" + nextId;

    // set text Content of etape dynamicly
    let labelEtapes = Clone.querySelector("label");
    labelEtapes.textContent = "Etape " + nextId;

    // Add a delete button for each etapes
    let deleteButton = document.createElement("button");
    deleteButton.textContent = "Supprimer l'Etape";
    deleteButton.classList.add("delete_button");

    deleteButton.addEventListener("click", function () {
      this.parentNode.remove();
      updateIds();
    });

    // Logic to add new div
    Clone.appendChild(deleteButton);
    Parent.insertBefore(Clone, BtDuplicate);
  };

  // updateIds when delete a clone Div
  function updateIds() {
    let divs = document.querySelectorAll(".duplid");
    divs.forEach(function (div, index) {
      div.id = "duplicate-" + (index + 1);
      let labelEtapes = div.querySelector("label");
      labelEtapes.textContent = "Etape " + (index + 1);
    });
  }
});
