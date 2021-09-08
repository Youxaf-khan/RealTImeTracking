  jQuery(function ($) {
    $(window).on("load", function () {
      initMap($("#map").data("vehicles"));
    })
  })

  window.initMap = function initMap() {
    let markers = [];
    var bounds = new google.maps.LatLngBounds()
    var infowindow = new google.maps.InfoWindow({})
    var map = new google.maps.Map(document.getElementById("map"), {
      zoom: 4,
    })
    window.bounds = bounds
    window.gmap = map
    window.markers =markers
    window.infowindow = infowindow
  }

  window.updateMap = function updateMap(locations) {
    remove_marker(locations)

    for (let i = 0; i < locations.length; i++) {
      const marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i]["gps"]["latitude"], locations[i]["gps"]["longitude"]),
        label: locations[i]["name"],
        map: gmap,
      });
      bounds.extend(marker.position)

      google.maps.event.addListener(marker,"click",(function (marker, i) {
        return function () {
          infowindow.setContent(
            "Name: " + locations[i]["name"] +
            ", Location: " + locations[i]["gps"]["reverseGeo"]["formattedLocation"]
          )
          infowindow.open(gmap, marker)
        }
      })(marker, i))
      markers.push(marker)
    }
    gmap.fitBounds(bounds)
  }

  function remove_marker(locations) {
    if (markers.length === locations.length) {

      for (let i = 0; i < markers.length; i++) {
        markers[i].setMap(null)
      }
      markers = []
    }
  }
