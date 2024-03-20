mapboxgl.accessToken = "<%= ENV['MAPBOX_ACCESS_KEY'] %>";

navigator.geolocation.getCurrentPosition(succesLocation, errorLocation, {
  enableHighAccuracy: true,
});

function succesLocation(position) {
  setupMap([position.coords.longitude, position.coords.latitude]);
}

function errorLocation() {
  setupMap([2.338715, 48.852969]);
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
    accessToken: mapboxgl.accessToken,
    unit: "metric",
  });
  map.addControl(directions, "top-left");
}
