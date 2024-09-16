import RestaurantLeaflet from "./restaurant_leaf_let"

const FoodTruckMap = {
    mounted() {
        selectPoint = JSON.parse(this.el.dataset.selectPoint)
        this.map = new RestaurantLeaflet(this.el, [selectPoint.latitude, selectPoint.longitude], event => {
            console.log(event)
        })


        this.pushEvent("load-food-trucks", {}, (reply, ref) => {
            reply.food_trucks.forEach(foodTruck => {
                this.map.addMarker(foodTruck)
            })
        })
    }
}

export default FoodTruckMap;