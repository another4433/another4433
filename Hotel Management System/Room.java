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
    Manager manager;
    KWArrayList<Cleaner> cleanerKWArrayList;

    public Room(){
        roomNumber = 0;
        floorNumber = 0;
        description = "";
        networkInformation = new Internet();
        owner = new Customer();
        manager = new Manager();
        cleanerKWArrayList = new KWArrayList<>();
    }

    public Room(int roomNumber, int floorNumber, String description, Customer owner, Manager manager) {
        this.roomNumber = Math.max(roomNumber, 0);
        this.floorNumber = Math.max(floorNumber, 0);
        this.description = description;
        this.owner = owner;
        this.manager = manager;
    }

    public Room(int roomNumber, int floorNumber, String description, String networkName, String passwordType, String password, String ipType, String ipAddress, Person provider, Person owner, int size){
        this.roomNumber = Math.max(roomNumber, 0);
        this.floorNumber = Math.max(floorNumber, 0);
        this.description = description;
        this.networkInformation = new Internet(networkName, passwordType, password, ipAddress, ipType, provider, owner);
        this.manager = new Manager();
        this.cleanerKWArrayList = new KWArrayList<>(size);
    }

    public Room(int roomNumber, int floorNumber, String description, Manager manager, int size){
        this.roomNumber = Math.max(roomNumber, 0);
        this.floorNumber = Math.max(floorNumber, 0);
        this.description = description;
        this.manager = manager;
        this.cleanerKWArrayList = new KWArrayList<>(size);
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

    public Manager getManager() {
        return manager;
    }

    public void setManager(String name, String phone, String email, long id, float money, int day, int month, int year, int house, int road, int block, String area, String state, String region, String continent, String country, String netName, String passwordType, String password, String ipAddress, String ipType, Person provider) {
        this.manager = new Manager(name, phone, email, id, money, day, month, year, house, road, block, area, state, region, continent, country, netName, passwordType, password, ipAddress, ipType, provider);
    }

    public KWArrayList<Cleaner> getCleanerKWArrayList() {
        return cleanerKWArrayList;
    }

    public void addCleaner(Cleaner item){
        getCleanerKWArrayList().addLast(item);
        getCleanerKWArrayList().sort();
    }

    public boolean deleteCleaner(Cleaner item){
        return getCleanerKWArrayList().remove(item) == getCleaner(getCleanerKWArrayList().indexOf(item));
    }

    public Cleaner getCleaner(int index){
        return getCleanerKWArrayList().get(index);
    }

    public int searchCleaner(Cleaner item){
        return getCleanerKWArrayList().search(item);
    }

    public boolean replaceCleaner(Cleaner oldCleaner, Cleaner newCleaner){
        getCleanerKWArrayList().replace(oldCleaner, newCleaner);
        return getCleanerKWArrayList().sort();
    }

    public void eraseCleaners(){
        getCleanerKWArrayList().shuffle();
        while (!getCleanerKWArrayList().isEmpty())
            getCleanerKWArrayList().removeFirst();
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
        System.out.println("Manager: ");
        getManager().display();
        System.out.println("Number of cleaners asigned to this room: "+getCleanerKWArrayList().size());
        System.out.println("Cleaners: ");
        getCleanerKWArrayList().display();
    }

    @Override
    public String toString() {
        return "Room{" +
                "roomNumber=" + roomNumber +
                ", floorNumber=" + floorNumber +
                ", description='" + description + '\'' +
                ", owner=" + owner + '\'' +
                ", internet=" + networkInformation + '\'' +
                ", manager=" + manager + '\'' +
                ", cleaners=" + cleanerKWArrayList +
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
