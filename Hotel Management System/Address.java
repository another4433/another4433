// Import AddressInt interface before usage
// Use "import com.company.AddressInt;" or something like that
// You don't need to do these when the files are located in the same src folder without syntax errors

public class Address implements AddressInt {
    int house, road, block;
    String area, state, region, continent, country;

    public Address(int house, int road, int block, String area, String state, String region, String continent, String country) {
        this.house = Math.max(house, 0);
        this.road = Math.max(road, 0);
        this.block = Math.max(block, 0);
        this.area = area;
        this.state = state;
        this.region = region;
        this.continent = continent;
        this.country = country;
    }

    public Address(){
        house = 0;
        road = 0;
        block = 0;
        area = "";
        state = "";
        region = "";
        continent = "";
        country = "";
    }

    @Override
    public int getHouse() {
        return house;
    }

    @Override
    public void setHouse(int house) {
        this.house = Math.max(house, 0);
    }

    @Override
    public int getRoad() {
        return road;
    }

    @Override
    public void setRoad(int road) {
        this.road = Math.max(road, 0);
    }

    @Override
    public int getBlock() {
        return block;
    }

    @Override
    public void setBlock(int block) {
        this.block = Math.max(block, 0);
    }

    @Override
    public String getArea() {
        return area;
    }

    @Override
    public void setArea(String area) {
        this.area = area;
    }

    @Override
    public String getState() {
        return state;
    }

    @Override
    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String getRegion() {
        return region;
    }

    @Override
    public void setRegion(String region) {
        this.region = region;
    }

    @Override
    public String getContinent() {
        return continent;
    }

    @Override
    public void setContinent(String continent) {
        this.continent = continent;
    }

    @Override
    public String getCountry() {
        return country;
    }

    @Override
    public void setCountry(String country) {
        this.country = country;
    }

    @Override
    public void display(){
        System.out.println("Address: ");
        System.out.println("House number: "+getHouse());
        System.out.println("Road number: "+getRoad());
        System.out.println("Block number: "+getBlock());
        System.out.println("Area: "+getArea());
        System.out.println("State: "+getState());
        System.out.println("Region: "+getRegion());
        System.out.println("Country: "+getCountry());
        System.out.println("Continent: "+getContinent());
    }

    @Override
    public String toString() {
        return "Address{" +
                "house=" + house +
                ", road=" + road +
                ", block=" + block +
                ", area='" + area + '\'' +
                ", state='" + state + '\'' +
                ", region='" + region + '\'' +
                ", continent='" + continent + '\'' +
                ", country='" + country + '\'' +
                '}';
    }
}
