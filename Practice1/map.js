function initMap() {
    var uluru = { lat: 51.6529678, lng: -0.2010643 };
    var map = new google.maps.Map(document.getElementById('mapx'), {
        zoom: 19,
        center: uluru
    });
    var marker = new google.maps.Marker({
        position: uluru,
        map: map
    });
}