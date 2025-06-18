/*
You need to import Person and Room classes to use this class
Use "import com.company.Person" or something like that
Use "import com.company.Room" or something like that
You don't need to do these when the files are located in the same src folder without syntax errors
*/

public class Customer extends Person {
    Room room;

    public Customer(){
        super();
        room = new Room();
    }

    public Customer(String name, String phone, String email, long id, float money, int day, int month, int year, int house, int road, int block, String area, String state, String region, String continent, String country, int roomNum, int floorNum, String description) {
        super(name, phone, email, id, money, day, month, year, house, road, block, area, state, region, continent, country);
        room = new Room(roomNum, floorNum, description, new Customer());
    }

    public Room getRoom() {
        return room;
    }

    public void checkIn(int room, int floor, String description) {
        getRoom().setRoomNumber(room);
        getRoom().setFloorNumber(floor);
        getRoom().setDescription(description);
        System.out.println("You have been checked in for your room.");
    }

    public int checkout(Room other){
        if (getRoom().equals(other)){
            System.out.println("You have been checked out from your room.");
            return getRoom().hashCode();
        }
        System.out.println("Failed to check out!");
        System.out.println("Room given is different than the room that you've been checked in.");
        return 0;
    }

    @Override
    public void display(){
        System.out.println("Customer: ");
        System.out.println("Name: "+getName());
        System.out.println("Age: "+calculateAge());
        System.out.println("Email: "+getEmail());
        System.out.println("ID: "+getID());
        System.out.println("Money: "+getMoney());
        System.out.println("Phone: "+getPhone());
        getBirthDate().display();
        getAddress().display();
        getRoom().display();
    }

    @Override
    public String toString() {
        return "Customer{" +
                "room=" + room +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address=" + address +
                ", birthDate=" + birthDate +
                ", id=" + id +
                ", money=" + money +
                '}';
    }
}
