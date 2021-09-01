import { map } from "jquery";

  jQuery(function ($) {
    $(window).on("load", function () {
      initMap($("#map").data("vehicles"));
    })
  })

  window.initMap = function initMap(locations) {

    var infowindow = new google.maps.InfoWindow({})
    var bounds = new google.maps.LatLngBounds()
    var marker

    var map = new google.maps.Map(document.getElementById("map"), {
      zoom: 4,
    })
    window.bound = bounds
    window.gmap = map
    window.vehicleinfo = infowindow

    if (typeof locations != "undefined") {

      for (var i = 0; i < locations.length; i++) {
        marker = new google.maps.Marker({
          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
          label: locations[i][0],
          map: gmap,
        })
        bounds.extend(marker.position)
      }
      gmap.fitBounds(bounds)
    }
  }

  window.updateMap = function updateMap(locations) {
    var marker
    if (typeof locations != "undefined") {

      for (var i = 0; i < locations.length; i++) {
        marker = new google.maps.Marker({
          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
          label: locations[i][0],
          map: gmap,
        })
        bound.extend(marker.position)

        google.maps.event.addListener(marker,"click",(function (marker, i) {
          return function () {
            vehicleinfo.setContent(
              "Name: " + locations[i][0] +
              ", Location: " + locations[i][3]
            )
            vehicleinfo.open(gmap, marker)
          }
        })(marker, i))
      }
      gmap.fitBounds(bound)
    }
  }
