function afficherPopup() {
    var confirmation = confirm("Souhaitez-vous changer la police d'écriture pour faciliter la lecture en cas de dyslexie ?");

    if (confirmation) {
        document.body.style.setProperty('font-family', 'Open-Dyslexic', 'important');
    }
}

window.onload = function() {
    afficherPopup();
};
