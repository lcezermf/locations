import L, { marker } from "leaflet"

class RestaurantLeaflet {
    constructor(element, positions, markerClickedCallback) {
        this.map = L.map(element).setView(positions, 13);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(this.map);

        this.markerClickedCallback = markerClickedCallback
    }

    addMarker(foodTruck) {
        const marker = L.marker([foodTruck.latitude, foodTruck.longitude], {
            foodTruckID: foodTruck.id
        })
            .addTo(this.map)
            .bindPopup(
                `<h3>${foodTruck.owner_name}</h3>
                <span>${foodTruck.description}</span>
                
                `
            )

        marker.on('click', e => {
            marker.openPopup()
            this.markerClickedCallback(e)
        })

        return marker
    }

    highlightMarker(foodTruck) {
        const marker = this.markerFoodTruck(foodTruck)
        marker.openPopup()
        this.map.panTo(marker.getLatLng());
    }

    markerFoodTruck(foodTruck) {
        let markerLayer;

        this.map.eachLayer(layer => {
            if (layer instanceof L.Marker) {
                const position = layer.getLatLng();

                if (position.lat === foodTruck.latitude && position.lng === foodTruck.longitude) {
                    markerLayer = layer
                }
            }

        });
        return markerLayer;
    }
}

export default RestaurantLeaflet;