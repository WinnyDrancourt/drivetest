(function () {
  // Api Key
  const apiKeyMetaTag = document.querySelector('meta[name="api_key"]');
  const apiKey = apiKeyMetaTag.getAttribute("content");
  mapboxgl.accessToken = apiKey;
  // End Api Key

  function generateStaticMapURL(coordinates) {
    // Replace 'your-access-token' with your Mapbox access token
    var accessToken = mapboxgl.accessToken;

    // Debugging: Log the coordinates array to check its content

    // Extracting latitude and longitude from the coordinates
    var latitude = parseFloat(coordinates[0].replace("[", ""));
    var longitude = parseFloat(coordinates[1].replace("]", ""));

    // Debugging: Log latitude and longitude to check their values

    var staticMapURL =
      "https://api.mapbox.com/styles/v1/mapbox/outdoors-v12/static/pin-s+ff0000(" +
      longitude +
      "," +
      latitude +
      ")/" +
      longitude +
      "," +
      latitude +
      ",12,0,0/250x250?access_token=" +
      accessToken;

    return staticMapURL;
  }

  // Generate static map for each city map container
  document.addEventListener("DOMContentLoaded", function () {
    var cityContainers = document.querySelectorAll('[id^="cityMapContainer_"]');

    cityContainers.forEach(function (container) {
      var cityElement = container.querySelector("p");

      if (cityElement) {
        var coordinates = cityElement.textContent.split(", ");
        var staticMapURL = generateStaticMapURL(coordinates);

        // Create a new image element for the static map
        var mapImage = new Image();
        mapImage.src = staticMapURL;
        mapImage.alt = "Static Map";

        // Remove existing map images from the container
        container.innerHTML = "";

        // Append the map image to the city map container
        container.appendChild(mapImage);
      } else {
      }
    });
  });
})();
