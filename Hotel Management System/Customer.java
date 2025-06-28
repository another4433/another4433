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
        room = new Room(roomNum, floorNum, description, new Customer(), new Manager());
        setAddress(house, road, block, area, state, region, continent, country);
        setBirthDate(day, month, year);
        setEmail(email);
        setID(id);
        setMoney(money);
        setName(name);
        setPhone(phone);
    }

    public Room getRoom() {
        return room;
    }

    public String checkIn(int room, int floor, String description) {
        getRoom().setRoomNumber(room);
        getRoom().setFloorNumber(floor);
        getRoom().setDescription(description);
        System.out.println("You have been checked in for your room.");
        return "You have been checked in to the room "+getRoom().getRoomNumber()+" at floor "+getRoom().getFloorNumber();
    }

    public int checkout(Room other){
        if (getRoom().equals(other)){
            System.out.println("You have been checked out from your room.");
            return getRoom().hashCode();
        }
        else {
            System.out.println("Failed to check out!");
            System.out.println("Room given is different than the room that you've been checked in.");
            return 0;
        }
    }

    public String requestClean(Room other){
        System.out.println("The customer "+getName()+" request the room "+other.getRoomNumber()+" at floor number "+other.getFloorNumber()+" to be clean.");
        return "The customer "+getName()+" request the room "+other.getRoomNumber()+" at floor number "+other.getFloorNumber()+" to be clean.";
    }

    public String orderFood(String[] foodList){
        StringBuilder builder = new StringBuilder("The waiter need to process the following orders: {");
        System.out.println("The waiter need to process the following orders: ");
        for (String item:foodList) {
            System.out.println(item);
            builder.append(item).append(", ");
        }
        builder.append("}").append("\n").append("This is for the customer ").append(getName()).append(".");
        System.out.println("This is for the customer "+getName());
        return builder.toString();
    }

    public String orderDrink(String[] drinkList){
        StringBuilder builder = new StringBuilder("The waiter need to process the following orders: {");
        System.out.println("The waiter need to process the following orders: ");
        for (String item:drinkList) {
            System.out.println(item);
            builder.append(item).append(", ");
        }
        builder.append("}").append("\n").append("This is for the customer ").append(getName()).append(".");
        System.out.println("This is for the customer "+getName());
        return builder.toString();
    }

    public String suggestTrip(String location){
        System.out.println("The customer "+getName()+" suggest going to "+location+" for field trip.");
        return "The customer "+getName()+" suggest going to "+location+" for field trip.";
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
