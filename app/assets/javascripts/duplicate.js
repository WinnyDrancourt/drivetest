let duplicate = document.getElementById("duplicate-1"),
  Parent = duplicate.parentNode,
  BtDuplicate = document.getElementById("bt-duplicate");

BtDuplicate.onclick = (event) => {
  event.preventDefault();

  let count = document.querySelectorAll(".duplid").length;
  let nextId = count + 1;

  let Clone = duplicate.cloneNode(true);
  Clone.id = "duplicate-" + nextId;

  Parent.insertBefore(Clone, BtDuplicate);
};
