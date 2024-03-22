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

let markers = [];

function setupMap(center) {
  var map = new mapboxgl.Map({
    container: "map",
    style: "mapbox://styles/mapbox/outdoors-v12",
    zoom: 10,
    center,
  });

  const nav = new mapboxgl.NavigationControl();
  map.addControl(nav);

  const geocoder = new MapboxGeocoder({
    // Initialize the geocoder
    accessToken: mapboxgl.accessToken, // Set the access token
    mapboxgl: mapboxgl, // Set the mapbox-gl instance
    marker: false, // Do not use the default marker style
  });

  // Add the geocoder to the map
  map.addControl(geocoder, "top-left");

  geocoder.on("result", function (e) {
    // Obtenez les coordonnées du résultat de géocodage
    const coordinates = e.result.geometry.coordinates;
    console.log("Marker position:", center);

    const marker = new mapboxgl.Marker().setLngLat(coordinates).addTo(map);
    markers.push(marker);

    map.on("contextmenu", function (e) {
      const clickedCoordinates = e.lngLat;

      const tolerance = 500; // Tolérance pour la proximité des marqueurs

      markers.forEach((marker, index) => {
        const markerCoordinates = marker.getLngLat();
        const distance = clickedCoordinates.distanceTo(markerCoordinates);

        if (distance < tolerance) {
          marker.remove();
          markers.splice(index, 1);
        }
      });
    });
  });
}
