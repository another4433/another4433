/*
You need to import Customer, Internet, and Person classes to use this class
Use "import com.company.Customer" or something like that
Use "import com.company.Internet" or something like that
Use "import com.company.Person" or something like that
You don't need to do these when the files are located in the same src folder without syntax errors
*/

public class Room {
    int roomNumber, floorNumber;
    String description;
    Customer owner;
    Internet networkInformation;

    public Room(){
        roomNumber = 0;
        floorNumber = 0;
        description = "";
        networkInformation = new Internet();
        owner = new Customer();
    }

    public Room(int roomNumber, int floorNumber, String description, Customer owner) {
        this.roomNumber = Math.max(roomNumber, 0);
        this.floorNumber = Math.max(floorNumber, 0);
        this.description = description;
        this.owner = owner;
    }

    public Room(int roomNumber, int floorNumber, String description, String networkName, String passwordType, String password, String ipType, String ipAddress, Person provider, Person owner){
        this.roomNumber = Math.max(roomNumber, 0);
        this.floorNumber = Math.max(floorNumber, 0);
        this.description = description;
        this.networkInformation = new Internet(networkName, passwordType, password, ipAddress, ipType, provider, owner);
    }

    public Room(int roomNumber, int floorNumber, String description){
        this.roomNumber = Math.max(roomNumber, 0);
        this.floorNumber = Math.max(floorNumber, 0);
        this.description = description;
    }

    public Internet getNetworkInformation() {
        return networkInformation;
    }

    public void setNetworkInformation(String networkName, String passwordType, String password, String ipType, String ipAddress, Person provider, Person owner) {
        getNetworkInformation().setName(networkName);
        getNetworkInformation().setIpAddress(ipAddress);
        getNetworkInformation().setIpType(ipType);
        getNetworkInformation().setOwner(owner);
        getNetworkInformation().setProvider(provider);
        getNetworkInformation().setOwner(owner);
        getNetworkInformation().setPassword(password);
        getNetworkInformation().setPasswordType(passwordType);
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = Math.max(roomNumber, 0);
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = Math.max(floorNumber, 0);
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Customer getOwner() {
        return owner;
    }

    public void setOwner(String name, String phone, String email, long id, float money, int day, int month, int year, int house, int road, int block, String area, String state, String region, String continent, String country, int roomNum, int floorNum, String description) {
        this.owner = new Customer(name, phone, email, id, money, day, month, year, house, road, block, area, state, region, continent, country, roomNum, floorNum, description);
    }

    public void display(){
        System.out.println("Room: ");
        System.out.println("Room number: "+getRoomNumber());
        System.out.println("Floor number: "+getFloorNumber());
        System.out.println("Description: "+getDescription());
        System.out.println("Owner: ");
        getOwner().display();
        getNetworkInformation().display();
    }

    @Override
    public String toString() {
        return "Room{" +
                "roomNumber=" + roomNumber +
                ", floorNumber=" + floorNumber +
                ", description='" + description + '\'' +
                ", owner=" + owner + '\'' +
                ", internet=" + networkInformation +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Room room = (Room) o;

        if (getRoomNumber() != room.getRoomNumber()) return false;
        if (getFloorNumber() != room.getFloorNumber()) return false;
        if (getDescription() != null ? !getDescription().equals(room.getDescription()) : room.getDescription() != null)
            return false;
        return getOwner().equals(room.getOwner());
    }

    @Override
    public int hashCode() {
        int result = getRoomNumber();
        result = 31 * result + getFloorNumber();
        result = 31 * result + (getDescription() != null ? getDescription().hashCode() : 0);
        result = 31 * result + getOwner().hashCode();
        return result;
    }
}
