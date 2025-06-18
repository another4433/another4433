/*
You need to import Internet and Person classes to use this class
Use "import com.company.Internet" or something like that
Use "import com.company.Person" or something like that
You don't need to do these when the files are located in the same src folder without syntax errors
*/

public class Manager extends Person {
    Internet personal;

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

    public String assignRoom(Customer tenet, Room room){
        System.out.println("Room "+room.getRoomNumber()+" at floor "+room.getFloorNumber()+" is assigned to "+tenet.getName());
        return "Room "+room.getRoomNumber()+" at floor "+room.getFloorNumber()+" is assigned to "+tenet.getName();
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
                ", money=" + money +
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
    }
}
