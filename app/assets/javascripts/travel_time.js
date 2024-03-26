(function () {
  // Api Key
  const apiKeyMetaTag = document.querySelector('meta[name="api_key"]');
  const apiKey = apiKeyMetaTag.getAttribute("content");
  mapboxgl.accessToken = apiKey;
  // End Api Key

  const MAPBOX_ACCESS_TOKEN = mapboxgl.accessToken;

  // Calculate travel time between two locations
  var origin = "New York"; // Example origin city
  var destination = "Los Angeles"; // Example destination city
  var url =
    "https://api.mapbox.com/directions/v5/mapbox/driving/" +
    origin +
    ";" +
    destination +
    "?access_token=" +
    MAPBOX_ACCESS_TOKEN;

  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      var travelTimeElement = document.getElementById("travelTime");
      if (data.routes && data.routes.length > 0) {
        var duration = data.routes[0].duration;
        var hours = Math.floor(duration / 3600);
        var minutes = Math.floor((duration % 3600) / 60);
        var seconds = duration % 60;
        travelTimeElement.innerHTML =
          "<p>Travel time: " +
          hours +
          " hours " +
          minutes +
          " minutes " +
          seconds +
          " seconds</p>";
      } else {
        travelTimeElement.innerHTML =
          "<p>Travel time could not be calculated</p>";
      }
    })
    .catch((error) => {
      console.error("Error:", error);
      document.getElementById("travelTime").innerHTML =
        "<p>Travel time could not be calculated</p>";
    });
})();
