/*
You need to import Internet and Person classes to use this class
Use "import com.company.Internet" or something like that
Use "import com.company.Person" or something like that
You don't need to do these when the files are located in the same src folder without syntax errors
*/

public class Manager extends Person {
    Internet personal;
    KWLinkedList<String> reservations = new KWLinkedList<>();

    public Manager(){
        super();
        personal = new Internet();
    }

    public Manager(String name, String phone, String email, long id, float money, int day, int month, int year, int house, int road, int block, String area, String state, String region, String continent, String country, String netName, String passwordType, String password, String ipAddress, String ipType, Person provider) {
        super(name, phone, email, id, money, day, month, year, house, road, block, area, state, region, continent, country);
        personal = new Internet(netName, passwordType, password, ipAddress, ipType, provider);
    }

    public Internet getPersonal() {
        return personal;
    }

    public void setPersonal(String netName, String passwordType, String password, String ipAddress, String ipType, Person provider, Person owner) {
        getPersonal().setName(netName);
        getPersonal().setIpType(ipType);
        getPersonal().setPasswordType(passwordType);
        getPersonal().setPassword(password);
        getPersonal().setOwner(owner);
        getPersonal().setProvider(provider);
        getPersonal().setIpAddress(ipAddress);
    }

    KWLinkedList<String> getReservations(){
        return reservations;
    }

    public String assignRoom(Customer tenet, Room room){
        System.out.println("Room "+room.getRoomNumber()+" at floor "+room.getFloorNumber()+" is assigned to "+tenet.getName());
        return "Room "+room.getRoomNumber()+" at floor "+room.getFloorNumber()+" is assigned to "+tenet.getName();
    }

    public String assignRestaurant(String tableCode, Customer[] people){
        StringBuilder builder = new StringBuilder("The table with the code ");
        builder.append(tableCode).append(" is assigned to the following customers: \n");
        System.out.println("The table with the code "+tableCode+" is assigned to the following customers: ");
        for (Customer person : people) {
            builder.append(person.getName()).append(" (").append(person.getID()).append(")\n");
            System.out.println(person.getName()+" ("+person.getID()+")");
        }
        getReservations().addLast(builder.toString());
        return builder.toString();
    }

    public void displayReservations(){
        getReservations().display();
    }

    public void removeReservation(int index){
        getReservations().remove(getReservations().get(index));
    }

    @Override
    public String toString() {
        return "Manager{" +
                "personal=" + personal +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address=" + address +
                ", birthDate=" + birthDate +
                ", id=" + id +
                ", money=" + money + '\'' +
                ", reservations=" + reservations +
                '}';
    }

    @Override
    public void display(){
        System.out.println("Manager: ");
        System.out.println("Name: "+getName());
        System.out.println("Age: "+calculateAge());
        System.out.println("Email: "+getEmail());
        System.out.println("ID: "+getID());
        System.out.println("Money: "+getMoney());
        System.out.println("Phone: "+getPhone());
        getBirthDate().display();
        getAddress().display();
        getPersonal().display();
        System.out.println("Reservations");
        displayReservations();
    }
}
