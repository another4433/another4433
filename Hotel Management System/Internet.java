/*
You need to import Person class to use this class
Use "import com.company.Person" or something like that
You don't need to do these when the files are located in the same src folder without syntax errors
*/

public class Internet {
    String name, passwordType, password, ipAddress, ipType;
    Person provider, owner;

    public Internet(){
        name = "";
        password = "";
        passwordType = "";
        ipAddress = "";
        ipType = "";
        provider = new Person();
        owner = new Person();
    }

    public Internet(String name, String passwordType, String password, String ipAddress, String ipType, Person provider, Person owner) {
        this.name = name;
        this.passwordType = passwordType;
        this.password = password;
        this.ipAddress = ipAddress;
        this.ipType = ipType;
        this.provider = provider;
        this.owner = owner;
    }

    public Internet(String name, String passwordType, String password, String ipAddress, String ipType, Person provider){
        this.name = name;
        this.passwordType = passwordType;
        this.password = password;
        this.ipAddress = ipAddress;
        this.ipType = ipType;
        this.provider = provider;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPasswordType() {
        return passwordType;
    }

    public void setPasswordType(String passwordType) {
        this.passwordType = passwordType;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getIpType() {
        return ipType;
    }

    public void setIpType(String ipType) {
        this.ipType = ipType;
    }

    public Person getProvider() {
        return provider;
    }

    public void setProvider(Person provider) {
        this.provider = provider;
    }

    public Person getOwner() {
        return owner;
    }

    public void setOwner(Person owner) {
        this.owner = owner;
    }

    @Override
    public String toString() {
        return "Internet{" +
                "name='" + name + '\'' +
                ", passwordType='" + passwordType + '\'' +
                ", password='" + password + '\'' +
                ", ipAddress='" + ipAddress + '\'' +
                ", ipType='" + ipType + '\'' +
                ", provider=" + provider +
                ", owner=" + owner +
                '}';
    }

    public void display(){
        System.out.println("Internet: ");
        System.out.println("Name: "+getName());
        System.out.println("Password: "+getPassword());
        System.out.println("Password Type: "+getPasswordType());
        System.out.println("IP Address: "+getIpAddress());
        System.out.println("IP Type: "+getIpType());
        System.out.println("Owner: ");
        getOwner().display();
        System.out.println("Provider: ");
        getProvider().display();
    }
}
