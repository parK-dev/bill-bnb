import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  console.log(mapboxgl)
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/abdul007/ckp69xw310dy718p0b14kdsmr',
    center: [-77.04, 38.907],
    zoom: 11.15,

  });

};

const addMarkersToMap = (map, markers) => {
   map.addControl(
        new mapboxgl.GeolocateControl({
            positionOptions: {
                enableHighAccuracy: true
            },
            trackUserLocation: true
        })

    );

  markers.forEach((marker) => {
    let el = document.createElement('div');
    el.innerHTML = marker.marker_html;
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);
    new mapboxgl.Marker(el)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map)


  });

  map.addControl(new mapboxgl.NavigationControl());


};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);

  }
};

const controls = () => {
  map.addControl(new mapboxgl.NavigationControl());
  };

export { initMapbox };
