// Api Key
const apiKeyMetaTag = document.querySelector('meta[name="api_key"]');
const apiKey = apiKeyMetaTag.getAttribute("content");
mapboxgl.accessToken = apiKey;
// End Api Key

navigator.geolocation.getCurrentPosition(succesLocation, errorLocation, {
  enableHighAccuracy: true,
});

function succesLocation(position) {
  setupMap([position.coords.longitude, position.coords.latitude]);
}

function errorLocation() {
  setupMap([3.16, 50.72]);
}

function setupMap(center) {
  var map = new mapboxgl.Map({
    container: "map",
    style: "mapbox://styles/mapbox/outdoors-v12",
    zoom: 10,
    center,
  });

  const nav = new mapboxgl.NavigationControl();
  map.addControl(nav);

  const directions = new MapboxDirections({
    accessToken: apiKey,
    unit: "metric",
  });
  //  map.addControl(directions, "top-left");
}
