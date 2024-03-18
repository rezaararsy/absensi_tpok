<style>
    #map2 {
        height: 250px;
    }

</style>

<div id="map2"></div>
<script>
    var lokasi = "{{ $presensi->lokasi_out }}";
    var lok = lokasi.split(",");
    var latitude = lok[0];
    var longitude = lok[1];
    var map2 = L.map('map2').setView([latitude, longitude], 18);
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19
        , attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map2);
    var marker = L.marker([latitude, longitude]).addTo(map2);
    var circle = L.circle([-7.291612116081597, 108.23092644299736], {
        color: 'red'
        , fillColor: '#f03'
        , fillOpacity: 0.5
        , radius: 20
    }).addTo(map2);

    var popup = L.popup()
        .setLatLng([latitude, longitude])
        .setContent("{{ $presensi->nama_lengkap }}")
        .openOn(map2);

</script>
