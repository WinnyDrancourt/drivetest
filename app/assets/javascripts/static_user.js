// Api Key
const apiKeyMetaTag = document.querySelector('meta[name="api_key"]');
const apiKey = apiKeyMetaTag.getAttribute("content");
mapboxgl.accessToken = apiKey;
// End Api Key

function getCityFromCoordinates() {
  const latitude = document
    .getElementById("coordinates_user")
    .querySelector("span:nth-of-type(1)")
    .textContent.trim();
  const longitude = document
    .getElementById("coordinates_user")
    .querySelector("span:nth-of-type(2)")
    .textContent.trim();
  let city = longitude + ", " + latitude;
  return city;
}
const city = getCityFromCoordinates();
// Call function to generate static map
generateStaticMap(city, "cityMapContainer");

function generateStaticMap(city, containerId) {
  const apiKey = mapboxgl.accessToken;
  const mapWidth = 600;
  const mapHeight = 400;
  const zoom = 12;

  // Construct the URL for static map image
  let url = `https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v12/static/`;

  // If city is coordinates, use them directly
  if (/^-?\d+(\.\d+)?,-?\d+(\.\d+)?$/.test(city)) {
    url += `${city},${zoom}/${mapWidth}x${mapHeight}?access_token=${apiKey}`;
    displayStaticMap(url, containerId);
  } else {
    // Otherwise, use geocoding API to get coordinates for the city
    const geocodingUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(city)}.json?access_token=${apiKey}`;

    fetch(geocodingUrl)
      .then((response) => {
        if (!response.ok) {
          throw new Error("Geocoding request failed");
        }
        return response.json();
      })
      .then((data) => {
        if (data.features && data.features.length > 0) {
          const coordinates = data.features[0].center;
          url += `${coordinates[0]},${coordinates[1]},${zoom}/${mapWidth}x${mapHeight}?access_token=${apiKey}`;
          displayStaticMap(url, containerId);
        } else {
          console.error("No features found for the provided city.");
        }
      })
      .catch((error) => console.error("Error:", error));
  }
}
function displayStaticMap(url, containerId) {
  const mapContainer = document.getElementById(containerId);
  mapContainer.innerHTML = `<img src="${url}" alt="Static Map">`;
}
