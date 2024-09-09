import RestaurantLeaflet from "./restaurant_leaf_let"

const FoodTruckMap = {
    mounted() {
        selectPoint = JSON.parse(this.el.dataset.selectPoint)
        this.map = new RestaurantLeaflet(this.el, [selectPoint.latitude, selectPoint.longitude])
    }
}

export default FoodTruckMap;