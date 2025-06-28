/*
You need to import Internet and Person classes to use this class
Use "import com.company.Internet" or something like that
Use "import com.company.Person" or something like that
You don't need to do these when the files are located in the same src folder without syntax errors
*/

public class Waiter extends Person {
    Internet personal;

    public Waiter(){
        super();
        personal = new Internet();
    }

    public Waiter(String name, String phone, String email, long id, float money, int day, int month, int year, int house, int road, int block, String area, String state, String region, String continent, String country, String netName, String passwordType, String password, String ipAddress, String ipType, Person provider) {
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

    public String takeOrder(Customer customer, String[] foodList, String[] drinkList){
        StringBuilder builder = new StringBuilder("Food: [");
        System.out.println("The customer "+customer.getName()+" requires the following orders: ");
        for (String item: foodList) {
            System.out.println(item);
            builder.append(item).append(", ");
        }
        builder.append("]\n");
        builder.append("Drink: [");
        for (String item1: drinkList){
            System.out.println(item1);
            builder.append(item1).append(", ");
        }
        builder.append("]");
        return builder.toString();
    }

    public String offerTrip(Customer customer, String location, Manager supervisor){
        System.out.println("The waiter "+getName()+" is offering the customer "+customer.getName()+" a trip to "+location+" that is supervised by "+supervisor.getName()+".");
        System.out.println("Customer phone number: "+customer.getPhone());
        System.out.println("Waiter phone number: "+getPhone());
        System.out.println("Manager phone number: "+supervisor.getPhone());
        return "The waiter "+getName()+" is offering the customer "+customer.getName()+" a trip to "+location+" that is supervised by "+supervisor.getName()+".\nCustomer phone number: "+customer.getPhone()+"\nWaiter phone number: "+getPhone()+"\nManager phone number: "+supervisor.getPhone();
    }

    @Override
    public String toString() {
        return "Waiter{" +
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
        System.out.println("Waiter: ");
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
