/*
You need to import Address and Date classes to use this class
You also need to import PersonInt to use this class
Use "import com.company.Address" or something like that
Use "import com.company.Date" or something like that
Use "import com.company.PersonInt" or something like that
You don't need to do these when the files are located in the same src folder without syntax errors
*/

public class Person implements PersonInt {
    String name, phone, email;
    Address address;
    Date birthDate;
    long id;
    float money;

    public Person(){
        name = "Someone";
        phone = "+97300000000";
        email = "someone@example.com";
        money = 0;
        id = 0;
        address = new Address();
        java.util.Date dateSetter = new java.util.Date();
        birthDate = new Date(dateSetter.getDay(), dateSetter.getMonth(), dateSetter.getYear());
    }

    public Person(String name, String phone, String email, long id, float money, int day, int month, int year, int house, int road, int block, String area, String state, String region, String continent, String country) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.id = Math.max(id, 0);
        this.money = Math.max(money, 0);
        this.birthDate = new Date(day, month, year);
        this.address = new Address(house, road, block, area, state, region, continent, country);
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String getPhone() {
        return phone;
    }

    @Override
    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public Address getAddress() {
        return address;
    }

    @Override
    public int calculateAge(){
        java.util.Date current = new java.util.Date();
        String dateGetter = current.toString();
        String yearGetter = dateGetter.substring(dateGetter.indexOf("2"));
        int year = Integer.parseInt(yearGetter);
        return year-getBirthDate().getYear();
    }

    @Override
    public void setAddress(int house, int road, int block, String area, String state, String region, String continent, String country) {
        this.getAddress().setArea(area);
        this.getAddress().setBlock(block);
        this.getAddress().setContinent(continent);
        this.getAddress().setCountry(country);
        this.getAddress().setHouse(house);
        this.getAddress().setRegion(region);
        this.getAddress().setState(state);
        this.getAddress().setRoad(road);
    }

    @Override
    public Date getBirthDate() {
        return birthDate;
    }

    @Override
    public void setBirthDate(int day, int month, int year) {
        this.getBirthDate().setYear(year);
        this.getBirthDate().setMonth(month);
        this.getBirthDate().setDay(day);
    }

    @Override
    public long getID() {
        return id;
    }

    @Override
    public void setID(long id) {
        this.id = Math.max(id, 0);
    }

    @Override
    public float getMoney() {
        return money;
    }

    @Override
    public void setMoney(float money) {
        this.money = Math.max(money, 0);
    }

    @Override
    public void display(){
        System.out.println("Person: ");
        System.out.println("Name: "+getName());
        System.out.println("Age: "+calculateAge());
        System.out.println("Email: "+getEmail());
        System.out.println("ID: "+getID());
        System.out.println("Money: "+getMoney());
        System.out.println("Phone: "+getPhone());
        getBirthDate().display();
        getAddress().display();
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address=" + address +
                ", birthDate=" + birthDate +
                ", id=" + id +
                ", money=" + money +
                '}';
    }
}
