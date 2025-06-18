/*
You need to import Address and Date classes to use this interface
Use "import com.company.Address" or something like that
Use "import com.company.Date" or something like that
You don't need to do these when the files are located in the same src folder without syntax errors
*/

public interface PersonInt {
    void setName(String name);
    void setID(long id);
    void setMoney(float money);
    void setEmail(String email);
    void setPhone(String phone);
    void setBirthDate(int day, int month, int year);
    int calculateAge();
    void setAddress(int house, int road, int block, String area, String state, String region, String continent, String country);
    String getName();
    long getID();
    float getMoney();
    String getEmail();
    String getPhone();
    Date getBirthDate();
    Address getAddress();
    void display();
}
