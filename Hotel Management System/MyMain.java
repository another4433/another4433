import java.util.*;

public class MyMain {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayStack<String> roomsForCleaning = new ArrayStack<>();
        LinkedStack<String> reservations = new LinkedStack<>();
        LinkedStack<Customer> reservedCustomer = new LinkedStack<>();
        LinkedStack2<String> bookings = new LinkedStack2<>();
        LinkedTree<String> restaurantRecords = new LinkedTree<>();
        ArrayQueue<String[]> foodOrders = new ArrayQueue<>();
        LinkedQueue<String[]> drinkOrders = new LinkedQueue<>();
        ArrayList<String> suggestions = new ArrayList<>();
        LinkedList<String> trips = new LinkedList<>();
        ArrayStack<String> requests = new ArrayStack<>();
        ArrayStack<String> cleanedRooms = new ArrayStack<>();
        KWArrayList<String> pendingCheckout = new KWArrayList<>();

        Date date;
        Address address;
        Person person = new Person();
        Person otherPerson;
        Customer customer = new Customer();
        Waiter waiter = new Waiter();
        Restaurant restaurant = new Restaurant();
        Internet internet = new Internet();
        Manager manager = new Manager();
        Cleaner cleaner = new Cleaner();
        Room room = new Room();
        Random random = new Random();

        KWLinkedList<Customer> customerKWLinkedList = new KWLinkedList<>();
        SingleLinkedList<Waiter> waiterSingleLinkedList = new SingleLinkedList<>();
        KWLinkedList<Cleaner> cleanerKWLinkedList = new KWLinkedList<>();
        SingleLinkedList<Room> roomSingleLinkedList = new SingleLinkedList<>();
        KWLinkedList<Internet> internetKWLinkedList = new KWLinkedList<>();
        KWArrayList<Person> peopleRecords = new KWArrayList<>();
        LinkedHashing<Address> addressLinkedHashing = new LinkedHashing<>();
        ArrayHashing<Date> dateArrayHashing = new ArrayHashing<>();
        SingleLinkedList<Room> removedRooms = new SingleLinkedList<>();

        int selector, pendingCheckoutIndex = -1;
        String[] currentFood, currentDrink;
        boolean proceed = false;
        boolean request = false;

        System.out.println("Welcome to AQWE Hotel!\n");
        System.out.println("Select from menu below: ");
        System.out.println("(0) Exit");
        System.out.println("(1) Create Restaurant");
        System.out.println("(2) Edit Restaurant");
        System.out.println("(3) Show Restaurant");
        System.out.println("(4) Add Customer");
        System.out.println("(5) Delete Customer");
        System.out.println("(6) Search for a customer");
        System.out.println("(7) Retrieve information about a customer");
        System.out.println("(8) Replace Customer");
        System.out.println("(9) Erase Customers");
        System.out.println("(10) Assign Manager");
        System.out.println("(11) Edit Manager");
        System.out.println("(12) Show Manager");
        System.out.println("(13) Add Room");
        System.out.println("(14) Delete Room");
        System.out.println("(15) Search for a Room");
        System.out.println("(16) Retrieve information about a room");
        System.out.println("(17) Replace Room");
        System.out.println("(18) Book a Room");
        System.out.println("(19) Erase Rooms");
        System.out.println("(20) Add Waiter");
        System.out.println("(21) Delete Waiter");
        System.out.println("(22) Search for a waiter");
        System.out.println("(23) Retrieve information about a waiter");
        System.out.println("(24) Replace Waiter");
        System.out.println("(25) Erase Waiters");
        System.out.println("(26) Add Cleaner");
        System.out.println("(27) Delete Cleaner");
        System.out.println("(28) Search for a cleaner");
        System.out.println("(29) Retrieve information about a cleaner");
        System.out.println("(30) Replace Cleaner");
        System.out.println("(31) Erase Cleaners");
        System.out.println("(32) Add Internet");
        System.out.println("(33) Delete Internet");
        System.out.println("(34) Search for an internet");
        System.out.println("(35) Retrieve information about an internet");
        System.out.println("(36) Replace Internet");
        System.out.println("(37) Erase Internets");
        System.out.println("(38) Add service");
        System.out.println("(39) Process service");
        System.out.println("(40) Add reservation");
        System.out.print("Answer: ");
        selector = scanner.nextInt();
        while (selector > 0){
            switch (selector){
                case 1 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        System.out.println("You need to assign internet for the restaurant.");
                        System.out.println("Choose option below: ");
                        System.out.println("(0) Cancel");
                        System.out.println("(1) Add Internet");
                        System.out.println("(2) Select Internet");
                        System.out.print("Answer: ");
                        int netSelector1 = scanner.nextInt();
                        switch (netSelector1){
                            case 1 -> {
                                System.out.println("You need to assign provider and owner for the internet.");
                                System.out.println("Choose option below: ");
                                System.out.println("(0) Cancel");
                                System.out.println("(1) Add Provider");
                                System.out.println("(2) Select Provider");
                                System.out.println("(3) Add Provider and Owner");
                                System.out.println("(4) Select Provider and Owner");
                                System.out.print("Answer: ");
                                int personSelector1 = scanner.nextInt();
                                switch (personSelector1){
                                    case 1 -> {
                                        System.out.print("Enter provider's name: ");
                                        String nothing1 = scanner.nextLine();
                                        String providerName1 = scanner.nextLine();
                                        System.out.print("Enter provider's phone number: ");
                                        String providerPhone1 = scanner.nextLine();
                                        System.out.print("Enter provider's email: ");
                                        String providerEmail1 = scanner.next();
                                        System.out.print("Enter provider's ID: ");
                                        long providerID1 = scanner.nextLong();
                                        System.out.println("How much money does the provider have? ");
                                        System.out.print("Answer: ");
                                        float providerMoney1 = scanner.nextFloat();
                                        System.out.print("Enter provider's birthDay: ");
                                        int providerDay1 = scanner.nextInt();
                                        System.out.print("Enter provider's birthMonth: ");
                                        int providerMonth1 = scanner.nextInt();
                                        System.out.print("Enter provider's birthYear: ");
                                        int providerYear1 = scanner.nextInt();
                                        System.out.print("Enter provider's house number: ");
                                        int providerHouse1 = scanner.nextInt();
                                        System.out.print("Enter provider's road number: ");
                                        int providerRoad1 = scanner.nextInt();
                                        System.out.print("Enter provider's block number: ");
                                        int providerBlock1 = scanner.nextInt();
                                        System.out.print("Enter provider's area: ");
                                        String providerArea1 = scanner.next();
                                        System.out.print("Enter provider's state: ");
                                        String providerState1 = scanner.nextLine();
                                        System.out.print("Enter provider's region: ");
                                        String providerRegion1 = scanner.nextLine();
                                        System.out.print("Enter provider's continent: ");
                                        String providerContinent1 = scanner.nextLine();
                                        System.out.print("Enter provider's country: ");
                                        String providerCountry1 = scanner.nextLine();
                                        person = new Person(providerName1, providerPhone1, providerEmail1, providerID1, providerMoney1, providerDay1, providerMonth1, providerYear1, providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                                        peopleRecords.addFirst(person);
                                        address = new Address(providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                                        addressLinkedHashing.add(address);
                                        date = new Date(providerDay1, providerMonth1, providerYear1);
                                        dateArrayHashing.add(date);
                                        System.out.println("Provider have been added");
                                    }
                                    case 2 -> {
                                        System.out.println("Enter the index of the list of providers: ");
                                        int personSelector2 = scanner.nextInt();
                                        person = peopleRecords.get(personSelector2);
                                        if (peopleRecords.indexOf(person) > -1){
                                            System.out.println("The provider have been selected correctly.");
                                            System.out.println("Provider "+person.getName()+" is found in the list with index "+peopleRecords.search(person));
                                        }
                                        else
                                            System.out.println("Failed to select correct provider!");
                                    }
                                    case 3 -> {
                                        System.out.print("Enter provider's name: ");
                                        String nothing2 = scanner.nextLine();
                                        String providerName1 = scanner.nextLine();
                                        System.out.print("Enter provider's phone number: ");
                                        String providerPhone1 = scanner.nextLine();
                                        System.out.print("Enter provider's email: ");
                                        String providerEmail1 = scanner.next();
                                        System.out.print("Enter provider's ID: ");
                                        long providerID1 = scanner.nextLong();
                                        System.out.println("How much money does the provider have? ");
                                        System.out.print("Answer: ");
                                        float providerMoney1 = scanner.nextFloat();
                                        System.out.print("Enter provider's birthDay: ");
                                        int providerDay1 = scanner.nextInt();
                                        System.out.print("Enter provider's birthMonth: ");
                                        int providerMonth1 = scanner.nextInt();
                                        System.out.print("Enter provider's birthYear: ");
                                        int providerYear1 = scanner.nextInt();
                                        System.out.print("Enter provider's house number: ");
                                        int providerHouse1 = scanner.nextInt();
                                        System.out.print("Enter provider's road number: ");
                                        int providerRoad1 = scanner.nextInt();
                                        System.out.print("Enter provider's block number: ");
                                        int providerBlock1 = scanner.nextInt();
                                        System.out.print("Enter provider's area: ");
                                        String providerArea1 = scanner.next();
                                        System.out.print("Enter provider's state: ");
                                        String providerState1 = scanner.nextLine();
                                        System.out.print("Enter provider's region: ");
                                        String providerRegion1 = scanner.nextLine();
                                        System.out.print("Enter provider's continent: ");
                                        String providerContinent1 = scanner.nextLine();
                                        System.out.print("Enter provider's country: ");
                                        String providerCountry1 = scanner.nextLine();
                                        Person person1 = new Person(providerName1, providerPhone1, providerEmail1, providerID1, providerMoney1, providerDay1, providerMonth1, providerYear1, providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                                        peopleRecords.addLast(person1);
                                        address = new Address(providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                                        addressLinkedHashing.add(address);
                                        date = new Date(providerDay1, providerMonth1, providerYear1);
                                        dateArrayHashing.add(date);
                                        System.out.println("Provider have been added");
                                        System.out.print("Enter owner's name: ");
                                        String ownerName1 = scanner.nextLine();
                                        System.out.print("Enter owner's phone number: ");
                                        String ownerPhone1 = scanner.nextLine();
                                        System.out.print("Enter owner's email: ");
                                        String ownerEmail1 = scanner.next();
                                        System.out.print("Enter owner's id: ");
                                        long ownerID1 = scanner.nextLong();
                                        System.out.println("How much money does the owner have? ");
                                        System.out.print("Answer: ");
                                        float ownerMoney1 = scanner.nextFloat();
                                        System.out.print("Enter owner's birthDay: ");
                                        int ownerDay1 = scanner.nextInt();
                                        System.out.print("Enter owner's birthMonth: ");
                                        int ownerMonth1 = scanner.nextInt();
                                        System.out.print("Enter owner's birthYear: ");
                                        int ownerYear1 = scanner.nextInt();
                                        System.out.print("Enter owner's house number: ");
                                        int ownerHouse1 = scanner.nextInt();
                                        System.out.print("Enter owner's road number: ");
                                        int ownerRoad1 = scanner.nextInt();
                                        System.out.print("Enter owner's block number: ");
                                        int ownerBlock1 = scanner.nextInt();
                                        System.out.print("Enter owner's area: ");
                                        String ownerArea1 = scanner.next();
                                        System.out.print("Enter owner's state: ");
                                        String ownerState1 = scanner.nextLine();
                                        System.out.print("Enter owner's region: ");
                                        String ownerRegion1 = scanner.nextLine();
                                        System.out.print("Enter owner's continent: ");
                                        String ownerContinent1 = scanner.nextLine();
                                        System.out.print("Enter owner's country: ");
                                        String ownerCountry1 = scanner.nextLine();
                                        otherPerson = new Person(ownerName1, ownerPhone1, ownerEmail1, ownerID1, ownerMoney1, ownerDay1, ownerMonth1, ownerYear1, ownerHouse1, ownerRoad1, ownerBlock1, ownerArea1, ownerState1, ownerRegion1, ownerContinent1, ownerCountry1);
                                        peopleRecords.addLast(otherPerson);
                                        date = new Date(ownerDay1, ownerMonth1, ownerYear1);
                                        dateArrayHashing.add(date);
                                        address = new Address(ownerHouse1, ownerRoad1, ownerBlock1, ownerArea1, ownerState1, ownerRegion1, ownerContinent1, ownerCountry1);
                                        addressLinkedHashing.add(address);
                                        System.out.println("Owner have been added to the list.");
                                    }
                                    case 4 -> {
                                        System.out.print("Enter the index for the list of providers: ");
                                        int providerSelector3 = scanner.nextInt();
                                        System.out.println("Enter the index for the list of owners: ");
                                        int ownerSelector1 = scanner.nextInt();
                                        person = peopleRecords.get(providerSelector3);
                                        otherPerson = peopleRecords.get(ownerSelector1);
                                        if (peopleRecords.indexOf(person) > -1 && peopleRecords.indexOf(otherPerson) > -1){
                                            System.out.println("Provider and owner have been retrieved correctly.");
                                            System.out.println("Provider "+person.getName()+" is found in the list with index "+peopleRecords.search(person));
                                            System.out.println("Owner "+otherPerson.getName()+" is found in the list with index "+peopleRecords.search(otherPerson));
                                        }
                                        else
                                            System.out.println("Failed to retrieve provider and owner correctly.");
                                    }
                                }
                                System.out.println("Time to create the internet!");
                                System.out.print("Enter internet name: ");
                                String nothing6 = scanner.nextLine();
                                String internetName1 = scanner.nextLine();
                                System.out.print("Enter internet password type: ");
                                String internetPassType1 = scanner.next();
                                System.out.print("Enter internet password: ");
                                String internetPass1 = scanner.nextLine();
                                System.out.print("Enter internet ip address: ");
                                String internetAddress1 = scanner.next();
                                System.out.print("Enter internet ip type: ");
                                String internetIPType = scanner.next();
                                internet = new Internet(internetName1, internetPassType1, internetPass1, internetAddress1, internetIPType, person);
                                internetKWLinkedList.addFirst(internet);
                            }
                            case 2 -> {
                                System.out.print("Enter the index of the list of internets: ");
                                int internetSelect1 = scanner.nextInt();
                                internet = internetKWLinkedList.get(internetSelect1);
                                if (internetKWLinkedList.indexOf(internet) > -1){
                                    System.out.println("The internet have been selected correctly.");
                                    System.out.println("The internet with the name "+internet.getName()+" is found in the list with index "+internetKWLinkedList.search(internet));
                                }
                                else
                                    System.out.println("Failed to select the correct internet!");
                            }
                        }
                        System.out.println("Time to create the restaurant!");
                        System.out.print("Enter restaurant name: ");
                        String nothing5 = scanner.nextLine();
                        String restaurantName1 = scanner.nextLine();
                        System.out.print("Enter number of tables in this restaurant: ");
                        int tableSize1 = scanner.nextInt();
                        System.out.print("Enter number of food options in this restaurant: ");
                        int foodSize1 = scanner.nextInt();
                        System.out.println("Enter number of drink options in this restaurant: ");
                        int drinkSize1 = scanner.nextInt();
                        System.out.print("Enter number of cleaners in this restaurant: ");
                        int cleanerSize1 = scanner.nextInt();
                        System.out.print("Enter number of waiters in this restaurant: ");
                        int waiterSize1 = scanner.nextInt();
                        restaurant = new Restaurant(restaurantName1, internet.getName(), internet.getPasswordType(), internet.getPassword(), internet.getIpAddress(), internet.getIpType(), internet.getProvider(), tableSize1, foodSize1, drinkSize1, cleanerSize1, waiterSize1);
                        System.out.println(restaurant.getName()+" restaurant have been created.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 2 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    boolean flag = false;
                    for (int i = 0; i < waiterSingleLinkedList.size(); i++)
                        if (waiterSingleLinkedList.get(i).getID() == managerID){
                            flag = true;
                            waiter = waiterSingleLinkedList.get(i);
                            break;
                        }
                    if (manager.getID() == managerID){
                        System.out.println("Choose the option below: ");
                        System.out.println("(0) Cancel");
                        System.out.println("(1) Edit restaurant name");
                        System.out.println("(2) Edit restaurant internet");
                        System.out.println("(3) Add table code");
                        System.out.println("(4) Delete table code");
                        System.out.println("(5) Search for a table code");
                        System.out.println("(6) Retrieve information for a table code");
                        System.out.println("(7) Replace table code");
                        System.out.println("(8) Erase table code");
                        System.out.println("(9) Add Waiter");
                        System.out.println("(10) Delete Waiter");
                        System.out.println("(11) Search for a waiter");
                        System.out.println("(12) Retrieve information about a waiter");
                        System.out.println("(13) Replace Waiter");
                        System.out.println("(14) Erase Waiters");
                        System.out.println("(15) Add Cleaner");
                        System.out.println("(16) Delete Cleaner");
                        System.out.println("(17) Search for a cleaner");
                        System.out.println("(18) Retrieve information about a cleaner");
                        System.out.println("(19) Replace Cleaner");
                        System.out.println("(20) Erase Cleaners");
                        System.out.println("(21) Add Food");
                        System.out.println("(22) Delete Food");
                        System.out.println("(23) Search for a food");
                        System.out.println("(24) Retrieve information about a food");
                        System.out.println("(25) Replace Food");
                        System.out.println("(26) Erase Foods");
                        System.out.println("(27) Add Drink");
                        System.out.println("(28) Delete Drink");
                        System.out.println("(29) Search for a drink");
                        System.out.println("(30) Retrieve information about a drink");
                        System.out.println("(31) Replace Drink");
                        System.out.println("(32) Erase Drinks");
                        System.out.print("Answer: ");
                        int restIntSelector = scanner.nextInt();
                        switch (restIntSelector){
                            case 1 -> {
                                System.out.print("Enter a new name for the restaurant: ");
                                String nothing4 = scanner.nextLine();
                                String newName1 = scanner.nextLine();
                                restaurant.setName(newName1);
                                System.out.println("Restaurant name have been already changed.");
                            }
                            case 2 -> {
                                System.out.print("Enter internet name: ");
                                String nothing6 = scanner.nextLine();
                                String internetName2 = scanner.nextLine();
                                System.out.print("Enter internet password type: ");
                                String internetPassType2 = scanner.next();
                                System.out.print("Enter internet password: ");
                                String internetPass2 = scanner.nextLine();
                                System.out.print("Enter internet ip address: ");
                                String internetAddress2 = scanner.next();
                                System.out.print("Enter internet ip type: ");
                                String internetIPType2 = scanner.next();
                                System.out.print("Enter provider's name: ");
                                String providerName1 = scanner.nextLine();
                                System.out.print("Enter provider's phone number: ");
                                String providerPhone1 = scanner.nextLine();
                                System.out.print("Enter provider's email: ");
                                String providerEmail1 = scanner.next();
                                System.out.print("Enter provider's ID: ");
                                long providerID1 = scanner.nextLong();
                                System.out.println("How much money does the provider have? ");
                                System.out.print("Answer: ");
                                float providerMoney1 = scanner.nextFloat();
                                System.out.print("Enter provider's birthDay: ");
                                int providerDay1 = scanner.nextInt();
                                System.out.print("Enter provider's birthMonth: ");
                                int providerMonth1 = scanner.nextInt();
                                System.out.print("Enter provider's birthYear: ");
                                int providerYear1 = scanner.nextInt();
                                System.out.print("Enter provider's house number: ");
                                int providerHouse1 = scanner.nextInt();
                                System.out.print("Enter provider's road number: ");
                                int providerRoad1 = scanner.nextInt();
                                System.out.print("Enter provider's block number: ");
                                int providerBlock1 = scanner.nextInt();
                                System.out.print("Enter provider's area: ");
                                String providerArea1 = scanner.next();
                                System.out.print("Enter provider's state: ");
                                String providerState1 = scanner.nextLine();
                                System.out.print("Enter provider's region: ");
                                String providerRegion1 = scanner.nextLine();
                                System.out.print("Enter provider's continent: ");
                                String providerContinent1 = scanner.nextLine();
                                System.out.print("Enter provider's country: ");
                                String providerCountry1 = scanner.nextLine();
                                Person person1 = new Person(providerName1, providerPhone1, providerEmail1, providerID1, providerMoney1, providerDay1, providerMonth1, providerYear1, providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                                peopleRecords.addLast(person1);
                                address = new Address(providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                                addressLinkedHashing.add(address);
                                date = new Date(providerDay1, providerMonth1, providerYear1);
                                dateArrayHashing.add(date);
                                System.out.println("Provider have been added");
                                System.out.print("Enter owner's name: ");
                                String ownerName1 = scanner.nextLine();
                                System.out.print("Enter owner's phone number: ");
                                String ownerPhone1 = scanner.nextLine();
                                System.out.print("Enter owner's email: ");
                                String ownerEmail1 = scanner.next();
                                System.out.print("Enter owner's id: ");
                                long ownerID1 = scanner.nextLong();
                                System.out.println("How much money does the owner have? ");
                                System.out.print("Answer: ");
                                float ownerMoney1 = scanner.nextFloat();
                                System.out.print("Enter owner's birthDay: ");
                                int ownerDay1 = scanner.nextInt();
                                System.out.print("Enter owner's birthMonth: ");
                                int ownerMonth1 = scanner.nextInt();
                                System.out.print("Enter owner's birthYear: ");
                                int ownerYear1 = scanner.nextInt();
                                System.out.print("Enter owner's house number: ");
                                int ownerHouse1 = scanner.nextInt();
                                System.out.print("Enter owner's road number: ");
                                int ownerRoad1 = scanner.nextInt();
                                System.out.print("Enter owner's block number: ");
                                int ownerBlock1 = scanner.nextInt();
                                System.out.print("Enter owner's area: ");
                                String ownerArea1 = scanner.next();
                                System.out.print("Enter owner's state: ");
                                String ownerState1 = scanner.nextLine();
                                System.out.print("Enter owner's region: ");
                                String ownerRegion1 = scanner.nextLine();
                                System.out.print("Enter owner's continent: ");
                                String ownerContinent1 = scanner.nextLine();
                                System.out.print("Enter owner's country: ");
                                String ownerCountry1 = scanner.nextLine();
                                otherPerson = new Person(ownerName1, ownerPhone1, ownerEmail1, ownerID1, ownerMoney1, ownerDay1, ownerMonth1, ownerYear1, ownerHouse1, ownerRoad1, ownerBlock1, ownerArea1, ownerState1, ownerRegion1, ownerContinent1, ownerCountry1);
                                peopleRecords.addLast(otherPerson);
                                date = new Date(ownerDay1, ownerMonth1, ownerYear1);
                                dateArrayHashing.add(date);
                                address = new Address(ownerHouse1, ownerRoad1, ownerBlock1, ownerArea1, ownerState1, ownerRegion1, ownerContinent1, ownerCountry1);
                                addressLinkedHashing.add(address);
                                System.out.println("Owner have been added to the list.");
                                restaurant.setNetworkInformation(internetName2, internetPassType2, internetPass2, internetAddress2, internetIPType2, person1, otherPerson);
                                System.out.println("The internet for the restaurant have been already changed.");
                            }
                            case 3 -> {
                                System.out.print("Enter table code: ");
                                String tableCode = scanner.next();
                                restaurant.addTableCode(tableCode);
                                System.out.println("Table code have been already added.");
                            }
                            case 4 -> {
                                System.out.print("Enter table code: ");
                                String tableCode = scanner.next();
                                if (restaurant.deleteTableCode(tableCode).equals(tableCode))
                                    System.out.println("Table code have been successfully deleted.");
                                else
                                    System.out.println("Failed to delete table code!");
                            }
                            case 5 -> {
                                System.out.print("Enter table code: ");
                                String tableCode = scanner.next();
                                int index = restaurant.searchTableCode(tableCode);
                                if (index > -1)
                                    System.out.println("Table code is found in the list at index "+index);
                                else
                                    System.out.println("Table code cannot be found from the list.");
                            }
                            case 6 -> {
                                System.out.print("Enter the index of table code list: ");
                                int codeIndex = scanner.nextInt();
                                System.out.println("Information found from the list: "+restaurant.getTableCodeItem(codeIndex));
                            }
                            case 7 -> {
                                System.out.print("Enter old table code: ");
                                String oldTableCode = scanner.next();
                                System.out.print("Enter new table code: ");
                                String newTableCode = scanner.next();
                                restaurant.replaceTableCode(oldTableCode, newTableCode);
                                System.out.println("Table code "+oldTableCode+" have been replaced by table code "+newTableCode);
                            }
                            case 8 -> {
                                restaurant.eraseTableCodes();
                                System.out.println("All table codes have been erased.");
                            }
                            case 9 -> {
                                System.out.print("Enter waiter name: ");
                                String nothing3 = scanner.nextLine();
                                String waiterName1 = scanner.nextLine();
                                System.out.print("Enter waiter phone number: ");
                                String waiterPhone1 = scanner.nextLine();
                                System.out.print("Enter waiter email: ");
                                String waiterEmail1 = scanner.next();
                                System.out.print("Enter waiter ID: ");
                                long waiterID1 = scanner.nextLong();
                                System.out.println("How much money does the waiter have? ");
                                System.out.print("Answer: ");
                                float waiterMoney1 = scanner.nextFloat();
                                System.out.print("Enter waiter birthDay: ");
                                int waiterDay1 = scanner.nextInt();
                                System.out.print("Enter waiter birthMonth: ");
                                int waiterMonth1 = scanner.nextInt();
                                System.out.print("Enter waiter birthYear: ");
                                int waiterYear1 = scanner.nextInt();
                                System.out.print("Enter waiter house number: ");
                                int waiterHouse1 = scanner.nextInt();
                                System.out.print("Enter waiter road number: ");
                                int waiterRoad1 = scanner.nextInt();
                                System.out.print("Enter waiter road number: ");
                                int waiterBlock1 = scanner.nextInt();
                                System.out.print("Enter waiter area: ");
                                String nothing4 = scanner.nextLine();
                                String waiterArea1 = scanner.nextLine();
                                System.out.print("Enter waiter state: ");
                                String waiterState1 = scanner.nextLine();
                                System.out.print("Enter waiter region: ");
                                String waiterRegion1 = scanner.nextLine();
                                System.out.print("Enter waiter continent: ");
                                String waiterContinent1 = scanner.nextLine();
                                System.out.print("Enter waiter country: ");
                                String waiterCountry1 = scanner.nextLine();
                                date = new Date(waiterDay1, waiterMonth1, waiterYear1);
                                address = new Address(waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                                dateArrayHashing.add(date);
                                addressLinkedHashing.add(address);
                                Person person3 = new Person(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                                peopleRecords.add(person3);
                                System.out.print("Enter waiter internet name: ");
                                String waiterNetName1 = scanner.nextLine();
                                System.out.print("Enter waiter internet password type: ");
                                String waiterNetPassType1 = scanner.next();
                                System.out.print("Enter waiter internet password: ");
                                String waiterNetPass1 = scanner.nextLine();
                                System.out.print("Enter waiter internet IP address: ");
                                String waiterNetIP1 = scanner.next();
                                System.out.print("Enter waiter internet IP type: ");
                                String waiterNetIPType1 = scanner.nextLine();
                                System.out.print("Enter internet provider name: ");
                                String providerName3 = scanner.nextLine();
                                System.out.print("Enter internet provider phone number: ");
                                String providerPhone3 = scanner.nextLine();
                                System.out.print("Enter internet provider email: ");
                                String providerEmail3 = scanner.next();
                                System.out.print("Enter internet provider ID: ");
                                long providerID3 = scanner.nextLong();
                                System.out.println("How much money does the provider have?");
                                System.out.print("Answer: ");
                                float providerMoney3 = scanner.nextFloat();
                                System.out.print("Enter internet provider birthDay: ");
                                int providerDay3 = scanner.nextInt();
                                System.out.print("Enter internet provider birthMonth: ");
                                int providerMonth3 = scanner.nextInt();
                                System.out.print("Enter internet provider birthYear: ");
                                int providerYear3 = scanner.nextInt();
                                System.out.print("Enter internet provider house number: ");
                                int providerHouse3 = scanner.nextInt();
                                System.out.print("Enter internet provider road number: ");
                                int providerRoad3 = scanner.nextInt();
                                System.out.print("Enter internet provider block number: ");
                                int providerBlock3 = scanner.nextInt();
                                System.out.print("Enter internet provider area: ");
                                String nothing5 = scanner.nextLine();
                                String providerArea3 = scanner.nextLine();
                                System.out.print("Enter internet provider state: ");
                                String providerState3 = scanner.nextLine();
                                System.out.print("Enter internet provider region: ");
                                String providerRegion3 = scanner.nextLine();
                                System.out.print("Enter internet provider continent: ");
                                String providerContinent3 = scanner.nextLine();
                                System.out.print("Enter internet provider country: ");
                                String providerCountry3 = scanner.nextLine();
                                date = new Date(providerDay3, providerMonth3, providerYear3);
                                address = new Address(providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                                dateArrayHashing.add(date);
                                addressLinkedHashing.add(address);
                                Person person4 = new Person(providerName3, providerPhone3, providerEmail3, providerID3, providerMoney3, providerDay3, providerMonth3, providerYear3, providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                                peopleRecords.add(person4);
                                waiter = new Waiter(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1, waiterNetName1, waiterNetPassType1, waiterNetPass1, waiterNetIP1, waiterNetIPType1, person4);
                                waiterSingleLinkedList.addLast(waiter);
                                restaurant.addWaiter(waiter);
                                System.out.println("Waiter have been added to the list of the restaurant successfully!");
                            }
                            case 10 -> {
                                System.out.print("Enter waiter name: ");
                                String nothing3 = scanner.nextLine();
                                String waiterName1 = scanner.nextLine();
                                System.out.print("Enter waiter phone number: ");
                                String waiterPhone1 = scanner.nextLine();
                                System.out.print("Enter waiter email: ");
                                String waiterEmail1 = scanner.next();
                                System.out.print("Enter waiter ID: ");
                                long waiterID1 = scanner.nextLong();
                                System.out.println("How much money does the waiter have? ");
                                System.out.print("Answer: ");
                                float waiterMoney1 = scanner.nextFloat();
                                System.out.print("Enter waiter birthDay: ");
                                int waiterDay1 = scanner.nextInt();
                                System.out.print("Enter waiter birthMonth: ");
                                int waiterMonth1 = scanner.nextInt();
                                System.out.print("Enter waiter birthYear: ");
                                int waiterYear1 = scanner.nextInt();
                                System.out.print("Enter waiter house number: ");
                                int waiterHouse1 = scanner.nextInt();
                                System.out.print("Enter waiter road number: ");
                                int waiterRoad1 = scanner.nextInt();
                                System.out.print("Enter waiter road number: ");
                                int waiterBlock1 = scanner.nextInt();
                                System.out.print("Enter waiter area: ");
                                String nothing4 = scanner.nextLine();
                                String waiterArea1 = scanner.nextLine();
                                System.out.print("Enter waiter state: ");
                                String waiterState1 = scanner.nextLine();
                                System.out.print("Enter waiter region: ");
                                String waiterRegion1 = scanner.nextLine();
                                System.out.print("Enter waiter continent: ");
                                String waiterContinent1 = scanner.nextLine();
                                System.out.print("Enter waiter country: ");
                                String waiterCountry1 = scanner.nextLine();
                                date = new Date(waiterDay1, waiterMonth1, waiterYear1);
                                address = new Address(waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                                dateArrayHashing.add(date);
                                addressLinkedHashing.add(address);
                                Person person3 = new Person(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                                peopleRecords.add(person3);
                                System.out.print("Enter waiter internet name: ");
                                String waiterNetName1 = scanner.nextLine();
                                System.out.print("Enter waiter internet password type: ");
                                String waiterNetPassType1 = scanner.next();
                                System.out.print("Enter waiter internet password: ");
                                String waiterNetPass1 = scanner.nextLine();
                                System.out.print("Enter waiter internet IP address: ");
                                String waiterNetIP1 = scanner.next();
                                System.out.print("Enter waiter internet IP type: ");
                                String waiterNetIPType1 = scanner.nextLine();
                                System.out.print("Enter internet provider name: ");
                                String providerName3 = scanner.nextLine();
                                System.out.print("Enter internet provider phone number: ");
                                String providerPhone3 = scanner.nextLine();
                                System.out.print("Enter internet provider email: ");
                                String providerEmail3 = scanner.next();
                                System.out.print("Enter internet provider ID: ");
                                long providerID3 = scanner.nextLong();
                                System.out.println("How much money does the provider have?");
                                System.out.print("Answer: ");
                                float providerMoney3 = scanner.nextFloat();
                                System.out.print("Enter internet provider birthDay: ");
                                int providerDay3 = scanner.nextInt();
                                System.out.print("Enter internet provider birthMonth: ");
                                int providerMonth3 = scanner.nextInt();
                                System.out.print("Enter internet provider birthYear: ");
                                int providerYear3 = scanner.nextInt();
                                System.out.print("Enter internet provider house number: ");
                                int providerHouse3 = scanner.nextInt();
                                System.out.print("Enter internet provider road number: ");
                                int providerRoad3 = scanner.nextInt();
                                System.out.print("Enter internet provider block number: ");
                                int providerBlock3 = scanner.nextInt();
                                System.out.print("Enter internet provider area: ");
                                String nothing5 = scanner.nextLine();
                                String providerArea3 = scanner.nextLine();
                                System.out.print("Enter internet provider state: ");
                                String providerState3 = scanner.nextLine();
                                System.out.print("Enter internet provider region: ");
                                String providerRegion3 = scanner.nextLine();
                                System.out.print("Enter internet provider continent: ");
                                String providerContinent3 = scanner.nextLine();
                                System.out.print("Enter internet provider country: ");
                                String providerCountry3 = scanner.nextLine();
                                date = new Date(providerDay3, providerMonth3, providerYear3);
                                address = new Address(providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                                dateArrayHashing.add(date);
                                addressLinkedHashing.add(address);
                                Person person4 = new Person(providerName3, providerPhone3, providerEmail3, providerID3, providerMoney3, providerDay3, providerMonth3, providerYear3, providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                                peopleRecords.add(person4);
                                waiter = new Waiter(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1, waiterNetName1, waiterNetPassType1, waiterNetPass1, waiterNetIP1, waiterNetIPType1, person4);
                                if (waiterSingleLinkedList.remove(waiter).equals(waiter))
                                    if (restaurant.deleteWaiter(waiter).equals(waiter))
                                        System.out.println("Waiter have been deleted successfully from the list of the restaurant.");
                                    else
                                        System.out.println("Failed to delete waiter successfully from the list of the restaurant, but it got deleted from the other list.");
                                else
                                    System.out.println("Failed to delete waiter successfully from the list.");
                            }
                            case 11 -> {
                                System.out.print("Enter waiter name: ");
                                String nothing3 = scanner.nextLine();
                                String waiterName1 = scanner.nextLine();
                                System.out.print("Enter waiter phone number: ");
                                String waiterPhone1 = scanner.nextLine();
                                System.out.print("Enter waiter email: ");
                                String waiterEmail1 = scanner.next();
                                System.out.print("Enter waiter ID: ");
                                long waiterID1 = scanner.nextLong();
                                System.out.println("How much money does the waiter have? ");
                                System.out.print("Answer: ");
                                float waiterMoney1 = scanner.nextFloat();
                                System.out.print("Enter waiter birthDay: ");
                                int waiterDay1 = scanner.nextInt();
                                System.out.print("Enter waiter birthMonth: ");
                                int waiterMonth1 = scanner.nextInt();
                                System.out.print("Enter waiter birthYear: ");
                                int waiterYear1 = scanner.nextInt();
                                System.out.print("Enter waiter house number: ");
                                int waiterHouse1 = scanner.nextInt();
                                System.out.print("Enter waiter road number: ");
                                int waiterRoad1 = scanner.nextInt();
                                System.out.print("Enter waiter road number: ");
                                int waiterBlock1 = scanner.nextInt();
                                System.out.print("Enter waiter area: ");
                                String nothing4 = scanner.nextLine();
                                String waiterArea1 = scanner.nextLine();
                                System.out.print("Enter waiter state: ");
                                String waiterState1 = scanner.nextLine();
                                System.out.print("Enter waiter region: ");
                                String waiterRegion1 = scanner.nextLine();
                                System.out.print("Enter waiter continent: ");
                                String waiterContinent1 = scanner.nextLine();
                                System.out.print("Enter waiter country: ");
                                String waiterCountry1 = scanner.nextLine();
                                date = new Date(waiterDay1, waiterMonth1, waiterYear1);
                                address = new Address(waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                                dateArrayHashing.add(date);
                                addressLinkedHashing.add(address);
                                Person person3 = new Person(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                                peopleRecords.add(person3);
                                System.out.print("Enter waiter internet name: ");
                                String waiterNetName1 = scanner.nextLine();
                                System.out.print("Enter waiter internet password type: ");
                                String waiterNetPassType1 = scanner.next();
                                System.out.print("Enter waiter internet password: ");
                                String waiterNetPass1 = scanner.nextLine();
                                System.out.print("Enter waiter internet IP address: ");
                                String waiterNetIP1 = scanner.next();
                                System.out.print("Enter waiter internet IP type: ");
                                String waiterNetIPType1 = scanner.nextLine();
                                System.out.print("Enter internet provider name: ");
                                String providerName3 = scanner.nextLine();
                                System.out.print("Enter internet provider phone number: ");
                                String providerPhone3 = scanner.nextLine();
                                System.out.print("Enter internet provider email: ");
                                String providerEmail3 = scanner.next();
                                System.out.print("Enter internet provider ID: ");
                                long providerID3 = scanner.nextLong();
                                System.out.println("How much money does the provider have?");
                                System.out.print("Answer: ");
                                float providerMoney3 = scanner.nextFloat();
                                System.out.print("Enter internet provider birthDay: ");
                                int providerDay3 = scanner.nextInt();
                                System.out.print("Enter internet provider birthMonth: ");
                                int providerMonth3 = scanner.nextInt();
                                System.out.print("Enter internet provider birthYear: ");
                                int providerYear3 = scanner.nextInt();
                                System.out.print("Enter internet provider house number: ");
                                int providerHouse3 = scanner.nextInt();
                                System.out.print("Enter internet provider road number: ");
                                int providerRoad3 = scanner.nextInt();
                                System.out.print("Enter internet provider block number: ");
                                int providerBlock3 = scanner.nextInt();
                                System.out.print("Enter internet provider area: ");
                                String nothing5 = scanner.nextLine();
                                String providerArea3 = scanner.nextLine();
                                System.out.print("Enter internet provider state: ");
                                String providerState3 = scanner.nextLine();
                                System.out.print("Enter internet provider region: ");
                                String providerRegion3 = scanner.nextLine();
                                System.out.print("Enter internet provider continent: ");
                                String providerContinent3 = scanner.nextLine();
                                System.out.print("Enter internet provider country: ");
                                String providerCountry3 = scanner.nextLine();
                                date = new Date(providerDay3, providerMonth3, providerYear3);
                                address = new Address(providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                                dateArrayHashing.add(date);
                                addressLinkedHashing.add(address);
                                Person person4 = new Person(providerName3, providerPhone3, providerEmail3, providerID3, providerMoney3, providerDay3, providerMonth3, providerYear3, providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                                peopleRecords.add(person4);
                                waiter = new Waiter(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1, waiterNetName1, waiterNetPassType1, waiterNetPass1, waiterNetIP1, waiterNetIPType1, person4);
                                waiterSingleLinkedList.addLast(waiter);
                                int waiterIndex1 = waiterSingleLinkedList.search(waiter);
                                int waiterIndex2 = restaurant.searchWaiter(waiter);
                                if (waiterIndex1 > -1 && waiterIndex2 > -1)
                                    System.out.println("Waiter is found in the list at index "+waiterIndex1+" and int the restaurant list at index "+waiterIndex2);
                                else
                                    System.out.println("Waiter is not found in the list.");
                            }
                            case 12 -> {
                                System.out.print("Enter the index from the waiter list: ");
                                int findingWaiter = scanner.nextInt();
                                System.out.println("Information found in that list: ");
                                System.out.println(restaurant.getWaiter(findingWaiter));
                            }
                            case 14 -> {
                                while (!waiterSingleLinkedList.isEmpty())
                                    waiterSingleLinkedList.removeFirst();
                                System.out.println("All waiters have been erased from the list.");
                            }
                            case 15 -> {
                                System.out.print("Enter cleaner name: ");
                                String nothing18 = scanner.nextLine();
                                String cleanerName1 = scanner.nextLine();
                                System.out.print("Enter cleaner phone number: ");
                                String cleanerPhone1 = scanner.nextLine();
                                System.out.print("Enter cleaner email: ");
                                String cleanerEmail1 = scanner.next();
                                System.out.print("Enter cleaner ID: ");
                                long cleanerID1 = scanner.nextLong();
                                System.out.println("How much money does the cleaner have?");
                                System.out.print("Answer: ");
                                float cleanerMoney1 = scanner.nextFloat();
                                System.out.print("Enter cleaner birthDay: ");
                                int cleanerDay1 = scanner.nextInt();
                                System.out.print("Enter cleaner birthMonth: ");
                                int cleanerMonth1 = scanner.nextInt();
                                System.out.print("Enter cleaner birthYear: ");
                                int cleanerYear1 = scanner.nextInt();
                                System.out.print("Enter cleaner house number: ");
                                int cleanerHouse1 = scanner.nextInt();
                                System.out.print("Enter cleaner road number: ");
                                int cleanerRoad1 = scanner.nextInt();
                                System.out.print("Enter cleaner block number: ");
                                int cleanerBlock1 = scanner.nextInt();
                                System.out.print("Enter cleaner area: ");
                                String nothing19 = scanner.nextLine();
                                String cleanerArea1 = scanner.nextLine();
                                System.out.print("Enter cleaner state: ");
                                String cleanerState1 = scanner.nextLine();
                                System.out.print("Enter cleaner region: ");
                                String cleanerRegion1 = scanner.nextLine();
                                System.out.print("Enter cleaner continent: ");
                                String cleanerContinent1 = scanner.nextLine();
                                System.out.print("Enter cleaner country: ");
                                String cleanerCountry1 = scanner.nextLine();
                                System.out.print("Enter cleaner internet name: ");
                                String cleanerNetName1 = scanner.nextLine();
                                System.out.print("Enter cleaner internet password type: ");
                                String cleanerNetPassType1 = scanner.next();
                                System.out.print("Enter cleaner internet password: ");
                                String cleanerNetPass1 = scanner.nextLine();
                                System.out.print("Enter cleaner internet IP address: ");
                                String cleanerNetIP1 = scanner.next();
                                System.out.print("Enter cleaner internet IP type: ");
                                String cleanerNetIPType1 = scanner.nextLine();
                                System.out.print("Enter internet provider name: ");
                                String providerName4 = scanner.nextLine();
                                System.out.print("Enter internet provider phone number: ");
                                String providerPhone4 = scanner.nextLine();
                                System.out.print("Enter internet provider email: ");
                                String providerEmail4 = scanner.next();
                                System.out.print("Enter internet provider ID: ");
                                long providerID4 = scanner.nextLong();
                                System.out.println("How much money does the provider have?");
                                System.out.print("Answer: ");
                                float providerMoney4 = scanner.nextFloat();
                                System.out.print("Enter internet provider birthDay: ");
                                int providerDay4 = scanner.nextInt();
                                System.out.print("Enter internet provider birthMonth: ");
                                int providerMonth4 = scanner.nextInt();
                                System.out.print("Enter internet provider birthYear: ");
                                int providerYear4 = scanner.nextInt();
                                System.out.print("Enter internet provider house number: ");
                                int providerHouse4 = scanner.nextInt();
                                System.out.print("Enter internet provider road number: ");
                                int providerRoad4 = scanner.nextInt();
                                System.out.print("Enter internet provider block number: ");
                                int providerBlock4 = scanner.nextInt();
                                System.out.print("Enter internet provider area: ");
                                String nothing20 = scanner.nextLine();
                                String providerArea4 = scanner.nextLine();
                                System.out.print("Enter internet provider state: ");
                                String providerState4 = scanner.nextLine();
                                System.out.print("Enter internet provider region: ");
                                String providerRegion4 = scanner.nextLine();
                                System.out.print("Enter internet provider continent: ");
                                String providerContinent4 = scanner.nextLine();
                                System.out.println("Enter internet provider country: ");
                                String providerCountry4 = scanner.nextLine();
                                Person person5 = new Person(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                                Address address3 = new Address(cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                                Date date3 = new Date(cleanerDay1, cleanerMonth1, cleanerYear1);
                                Person person6 = new Person(providerName4, providerPhone4, providerEmail4, providerID4, providerMoney4, providerDay4, providerMonth4, providerYear4, providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                                Address address4 = new Address(providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                                Date date4 = new Date(providerDay4, providerMonth4, providerYear4);
                                peopleRecords.add(person5);
                                peopleRecords.add(person6);
                                addressLinkedHashing.add(address3);
                                addressLinkedHashing.add(address4);
                                dateArrayHashing.add(date3);
                                dateArrayHashing.add(date4);
                                cleaner = new Cleaner(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1 ,cleanerNetName1, cleanerNetPassType1, cleanerNetPass1, cleanerNetIP1, cleanerNetIPType1, person6);
                                cleanerKWLinkedList.addFirst(cleaner);
                                restaurant.addCleaner(cleaner);
                                System.out.println("Cleaner have been successfully added to the list of the restaurant. ");
                            }
                            case 16 -> {
                                System.out.print("Enter cleaner name: ");
                                String nothing18 = scanner.nextLine();
                                String cleanerName1 = scanner.nextLine();
                                System.out.print("Enter cleaner phone number: ");
                                String cleanerPhone1 = scanner.nextLine();
                                System.out.print("Enter cleaner email: ");
                                String cleanerEmail1 = scanner.next();
                                System.out.print("Enter cleaner ID: ");
                                long cleanerID1 = scanner.nextLong();
                                System.out.println("How much money does the cleaner have?");
                                System.out.print("Answer: ");
                                float cleanerMoney1 = scanner.nextFloat();
                                System.out.print("Enter cleaner birthDay: ");
                                int cleanerDay1 = scanner.nextInt();
                                System.out.print("Enter cleaner birthMonth: ");
                                int cleanerMonth1 = scanner.nextInt();
                                System.out.print("Enter cleaner birthYear: ");
                                int cleanerYear1 = scanner.nextInt();
                                System.out.print("Enter cleaner house number: ");
                                int cleanerHouse1 = scanner.nextInt();
                                System.out.print("Enter cleaner road number: ");
                                int cleanerRoad1 = scanner.nextInt();
                                System.out.print("Enter cleaner block number: ");
                                int cleanerBlock1 = scanner.nextInt();
                                System.out.print("Enter cleaner area: ");
                                String nothing19 = scanner.nextLine();
                                String cleanerArea1 = scanner.nextLine();
                                System.out.print("Enter cleaner state: ");
                                String cleanerState1 = scanner.nextLine();
                                System.out.print("Enter cleaner region: ");
                                String cleanerRegion1 = scanner.nextLine();
                                System.out.print("Enter cleaner continent: ");
                                String cleanerContinent1 = scanner.nextLine();
                                System.out.print("Enter cleaner country: ");
                                String cleanerCountry1 = scanner.nextLine();
                                System.out.print("Enter cleaner internet name: ");
                                String cleanerNetName1 = scanner.nextLine();
                                System.out.print("Enter cleaner internet password type: ");
                                String cleanerNetPassType1 = scanner.next();
                                System.out.print("Enter cleaner internet password: ");
                                String cleanerNetPass1 = scanner.nextLine();
                                System.out.print("Enter cleaner internet IP address: ");
                                String cleanerNetIP1 = scanner.next();
                                System.out.print("Enter cleaner internet IP type: ");
                                String cleanerNetIPType1 = scanner.nextLine();
                                System.out.print("Enter internet provider name: ");
                                String providerName4 = scanner.nextLine();
                                System.out.print("Enter internet provider phone number: ");
                                String providerPhone4 = scanner.nextLine();
                                System.out.print("Enter internet provider email: ");
                                String providerEmail4 = scanner.next();
                                System.out.print("Enter internet provider ID: ");
                                long providerID4 = scanner.nextLong();
                                System.out.println("How much money does the provider have?");
                                System.out.print("Answer: ");
                                float providerMoney4 = scanner.nextFloat();
                                System.out.print("Enter internet provider birthDay: ");
                                int providerDay4 = scanner.nextInt();
                                System.out.print("Enter internet provider birthMonth: ");
                                int providerMonth4 = scanner.nextInt();
                                System.out.print("Enter internet provider birthYear: ");
                                int providerYear4 = scanner.nextInt();
                                System.out.print("Enter internet provider house number: ");
                                int providerHouse4 = scanner.nextInt();
                                System.out.print("Enter internet provider road number: ");
                                int providerRoad4 = scanner.nextInt();
                                System.out.print("Enter internet provider block number: ");
                                int providerBlock4 = scanner.nextInt();
                                System.out.print("Enter internet provider area: ");
                                String nothing20 = scanner.nextLine();
                                String providerArea4 = scanner.nextLine();
                                System.out.print("Enter internet provider state: ");
                                String providerState4 = scanner.nextLine();
                                System.out.print("Enter internet provider region: ");
                                String providerRegion4 = scanner.nextLine();
                                System.out.print("Enter internet provider continent: ");
                                String providerContinent4 = scanner.nextLine();
                                System.out.println("Enter internet provider country: ");
                                String providerCountry4 = scanner.nextLine();
                                Person person5 = new Person(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                                Address address3 = new Address(cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                                Date date3 = new Date(cleanerDay1, cleanerMonth1, cleanerYear1);
                                Person person6 = new Person(providerName4, providerPhone4, providerEmail4, providerID4, providerMoney4, providerDay4, providerMonth4, providerYear4, providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                                Address address4 = new Address(providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                                Date date4 = new Date(providerDay4, providerMonth4, providerYear4);
                                peopleRecords.add(person5);
                                peopleRecords.add(person6);
                                addressLinkedHashing.add(address3);
                                addressLinkedHashing.add(address4);
                                dateArrayHashing.add(date3);
                                dateArrayHashing.add(date4);
                                cleaner = new Cleaner(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1 ,cleanerNetName1, cleanerNetPassType1, cleanerNetPass1, cleanerNetIP1, cleanerNetIPType1, person6);
                                if (cleanerKWLinkedList.remove(cleaner).equals(cleaner))
                                    if (restaurant.deleteCleaner(cleaner).equals(cleaner))
                                        System.out.println("Cleaner have been deleted from the list of the restaurant successfully.");
                                    else
                                        System.out.println("Failed to successfully delete cleaner from the list of the restaurant, but it got deleted from the other list.");
                                else
                                    System.out.println("Failed to successfully delete cleaner from the list.");
                            }
                            case 17 -> {
                                System.out.print("Enter cleaner name: ");
                                String nothing18 = scanner.nextLine();
                                String cleanerName1 = scanner.nextLine();
                                System.out.print("Enter cleaner phone number: ");
                                String cleanerPhone1 = scanner.nextLine();
                                System.out.print("Enter cleaner email: ");
                                String cleanerEmail1 = scanner.next();
                                System.out.print("Enter cleaner ID: ");
                                long cleanerID1 = scanner.nextLong();
                                System.out.println("How much money does the cleaner have?");
                                System.out.print("Answer: ");
                                float cleanerMoney1 = scanner.nextFloat();
                                System.out.print("Enter cleaner birthDay: ");
                                int cleanerDay1 = scanner.nextInt();
                                System.out.print("Enter cleaner birthMonth: ");
                                int cleanerMonth1 = scanner.nextInt();
                                System.out.print("Enter cleaner birthYear: ");
                                int cleanerYear1 = scanner.nextInt();
                                System.out.print("Enter cleaner house number: ");
                                int cleanerHouse1 = scanner.nextInt();
                                System.out.print("Enter cleaner road number: ");
                                int cleanerRoad1 = scanner.nextInt();
                                System.out.print("Enter cleaner block number: ");
                                int cleanerBlock1 = scanner.nextInt();
                                System.out.print("Enter cleaner area: ");
                                String nothing19 = scanner.nextLine();
                                String cleanerArea1 = scanner.nextLine();
                                System.out.print("Enter cleaner state: ");
                                String cleanerState1 = scanner.nextLine();
                                System.out.print("Enter cleaner region: ");
                                String cleanerRegion1 = scanner.nextLine();
                                System.out.print("Enter cleaner continent: ");
                                String cleanerContinent1 = scanner.nextLine();
                                System.out.print("Enter cleaner country: ");
                                String cleanerCountry1 = scanner.nextLine();
                                System.out.print("Enter cleaner internet name: ");
                                String cleanerNetName1 = scanner.nextLine();
                                System.out.print("Enter cleaner internet password type: ");
                                String cleanerNetPassType1 = scanner.next();
                                System.out.print("Enter cleaner internet password: ");
                                String cleanerNetPass1 = scanner.nextLine();
                                System.out.print("Enter cleaner internet IP address: ");
                                String cleanerNetIP1 = scanner.next();
                                System.out.print("Enter cleaner internet IP type: ");
                                String cleanerNetIPType1 = scanner.nextLine();
                                System.out.print("Enter internet provider name: ");
                                String providerName4 = scanner.nextLine();
                                System.out.print("Enter internet provider phone number: ");
                                String providerPhone4 = scanner.nextLine();
                                System.out.print("Enter internet provider email: ");
                                String providerEmail4 = scanner.next();
                                System.out.print("Enter internet provider ID: ");
                                long providerID4 = scanner.nextLong();
                                System.out.println("How much money does the provider have?");
                                System.out.print("Answer: ");
                                float providerMoney4 = scanner.nextFloat();
                                System.out.print("Enter internet provider birthDay: ");
                                int providerDay4 = scanner.nextInt();
                                System.out.print("Enter internet provider birthMonth: ");
                                int providerMonth4 = scanner.nextInt();
                                System.out.print("Enter internet provider birthYear: ");
                                int providerYear4 = scanner.nextInt();
                                System.out.print("Enter internet provider house number: ");
                                int providerHouse4 = scanner.nextInt();
                                System.out.print("Enter internet provider road number: ");
                                int providerRoad4 = scanner.nextInt();
                                System.out.print("Enter internet provider block number: ");
                                int providerBlock4 = scanner.nextInt();
                                System.out.print("Enter internet provider area: ");
                                String nothing20 = scanner.nextLine();
                                String providerArea4 = scanner.nextLine();
                                System.out.print("Enter internet provider state: ");
                                String providerState4 = scanner.nextLine();
                                System.out.print("Enter internet provider region: ");
                                String providerRegion4 = scanner.nextLine();
                                System.out.print("Enter internet provider continent: ");
                                String providerContinent4 = scanner.nextLine();
                                System.out.println("Enter internet provider country: ");
                                String providerCountry4 = scanner.nextLine();
                                Person person5 = new Person(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                                Address address3 = new Address(cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                                Date date3 = new Date(cleanerDay1, cleanerMonth1, cleanerYear1);
                                Person person6 = new Person(providerName4, providerPhone4, providerEmail4, providerID4, providerMoney4, providerDay4, providerMonth4, providerYear4, providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                                Address address4 = new Address(providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                                Date date4 = new Date(providerDay4, providerMonth4, providerYear4);
                                peopleRecords.add(person5);
                                peopleRecords.add(person6);
                                addressLinkedHashing.add(address3);
                                addressLinkedHashing.add(address4);
                                dateArrayHashing.add(date3);
                                dateArrayHashing.add(date4);
                                cleaner = new Cleaner(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1 ,cleanerNetName1, cleanerNetPassType1, cleanerNetPass1, cleanerNetIP1, cleanerNetIPType1, person6);
                                int cleanerIndex1 = cleanerKWLinkedList.search(cleaner);
                                int cleanerIndex3 = restaurant.searchCleaner(cleaner);
                                if (cleanerIndex1 > -1 && cleanerIndex3 > -1)
                                    System.out.println("The cleaner is found in the list at index "+cleanerIndex1+" and in the restaurant list at index "+cleanerIndex3);
                                else
                                    System.out.println("The cleaner cannot be found in the list.");
                            }
                            case 18 -> {
                                System.out.print("Enter the index from the cleaner list: ");
                                int cleanerIndex2 = scanner.nextInt();
                                System.out.println("Information found in that list: ");
                                System.out.println(restaurant.getCleaner(cleanerIndex2));
                            }
                            case 20 -> {
                                while (!cleanedRooms.isEmpty())
                                    cleanerKWLinkedList.removeLast();
                                System.out.println("All cleaners have been deleted from the list.");
                            }
                            case 21 -> {
                                System.out.print("Enter a food name: ");
                                String nothing7 = scanner.nextLine();
                                String foodItem = scanner.nextLine();
                                restaurant.addFood(foodItem);
                                System.out.println("A food have been added to the list. ");
                            }
                            case 22 -> {
                                System.out.print("Enter a food name: ");
                                String nothing8 = scanner.nextLine();
                                String foodItem = scanner.nextLine();
                                if (restaurant.deleteFood(foodItem).equals(foodItem))
                                    System.out.println("A food have been deleted successfully.");
                                else
                                    System.out.println("Failed to delete a food!");
                            }
                            case 23 -> {
                                System.out.print("Enter food name: ");
                                String nothing9 = scanner.nextLine();
                                String foodItem = scanner.nextLine();
                                int foodIndex = restaurant.searchFood(foodItem);
                                if (foodIndex > -1)
                                    System.out.println("The food is found in the list at index "+foodIndex);
                                else 
                                    System.out.println("Food not found in the list.");
                            }
                            case 24 -> {
                                System.out.print("Enter the index from the food list: ");
                                int foodIndex = scanner.nextInt();
                                System.out.println("Information found from the list: "+restaurant.getFood(foodIndex));
                            }
                            case 25 -> {
                                System.out.print("Enter old food: ");
                                String nothing10 = scanner.nextLine();
                                String oldFood = scanner.nextLine();
                                System.out.print("Enter new food: ");
                                String newFood = scanner.nextLine();
                                restaurant.replaceFood(oldFood, newFood);
                                System.out.println("The food "+oldFood+" have been replaced by "+newFood);
                            }
                            case 26 -> {
                                restaurant.eraseFood();
                                System.out.println("All foods have been erased.");
                            }
                            case 27 -> {
                                System.out.print("Enter a drink name: ");
                                String nothing11 = scanner.nextLine();
                                String drinkItem = scanner.nextLine();
                                restaurant.addDrink(drinkItem);
                                System.out.println("A drink have been added to the list.");
                            }
                            case 28 -> {
                                System.out.print("Enter a drink name: ");
                                String nothing12 = scanner.nextLine();
                                String drinkItem = scanner.nextLine();
                                if (restaurant.deleteDrink(drinkItem).equals(drinkItem))
                                    System.out.println("A drink have been successfully deleted.");
                                else
                                    System.out.println("Failed to delete a drink!");
                            }
                            case 29 -> {
                                System.out.print("Enter a drink name: ");
                                String nothing13 = scanner.nextLine();
                                String drinkItem = scanner.nextLine();
                                int drinkIndex = restaurant.searchDrink(drinkItem);
                                if (drinkIndex > -1)
                                    System.out.println("The drink is found in the list at index "+drinkIndex);
                                else
                                    System.out.println("The drink is not found in the list.");
                            }
                            case 30 -> {
                                System.out.print("Enter index of drink list: ");
                                int drinkIndex = scanner.nextInt();
                                System.out.println("Information found from the list: "+restaurant.getDrink(drinkIndex));
                            }
                            case 31 -> {
                                System.out.print("Enter old drink: ");
                                String nothing14 = scanner.nextLine();
                                String oldDrink = scanner.nextLine();
                                System.out.print("Enter new drink: ");
                                String newDrink = scanner.nextLine();
                                restaurant.replaceDrink(oldDrink, newDrink);
                                System.out.println("The drink "+oldDrink+" have been replaced by "+newDrink);
                            }
                            case 32 -> {
                                restaurant.eraseDrinks();
                                System.out.println("All drinks have been erased.");
                            }
                        }
                    }
                    else if (flag){
                        System.out.println("Choose option below: ");
                        System.out.println("(0) Cancel");
                        System.out.println("(1) Add Order");
                        System.out.println("(2) Proceed Order");
                        System.out.println("(3) Display Orders");
                        System.out.print("Answer: ");
                        int waiterIndex = scanner.nextInt();
                        if (waiterIndex == 2)
                            restaurantRecords.getRoot().left.data = restaurant.proceedOrder();
                        else if (waiterIndex == 3){
                            System.out.println("Processed order: ");
                            System.out.println(restaurantRecords.getRoot().left.getData());
                            System.out.println("Taken order: ");
                            System.out.println(restaurantRecords.getRoot().right.getData());
                        }
                        else if (waiterIndex == 1){
                            if (proceed){
                                while (!reservedCustomer.isEmpty() && !foodOrders.isEmpty() && !drinkOrders.isEmpty()){
                                    restaurantRecords.getRoot().right.data = waiter.takeOrder(reservedCustomer.peek(), foodOrders.peek(), drinkOrders.peek());
                                    restaurant.addOrder(reservedCustomer.pop(), foodOrders.removeLast(), drinkOrders.removeLast());
                                }
                                System.out.println("All orders have been added to the queue.");
                            }
                            else
                                System.out.println("None of the customers made any order.");
                        }
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager or a waiter to access this feature.");
                    }
                }
                case 3 -> restaurant.display();
                case 4 -> {
                    System.out.print("Enter customer name: ");
                    String nothing23 = scanner.nextLine();
                    String customerName1 = scanner.nextLine();
                    System.out.print("Enter customer phone number: ");
                    String customerPhone1 = scanner.nextLine();
                    System.out.print("Enter customer email: ");
                    String customerEmail1 = scanner.next();
                    System.out.print("Enter customer ID: ");
                    long customerID1 = scanner.nextLong();
                    System.out.println("How much money does the customer have? ");
                    System.out.print("Answer: ");
                    float customerMoney1 = scanner.nextFloat();
                    System.out.print("Enter customer birthDay: ");
                    int customerDay1 = scanner.nextInt();
                    System.out.print("Enter customer birthMonth: ");
                    int customerMonth1 = scanner.nextInt();
                    System.out.print("Enter customer birthYear: ");
                    int customerYear1 = scanner.nextInt();
                    System.out.print("Enter customer house number: ");
                    int customerHouse1 = scanner.nextInt();
                    System.out.print("Enter customer road number: ");
                    int customerRoad1 = scanner.nextInt();
                    System.out.print("Enter customer block number: ");
                    int customerBlock1 = scanner.nextInt();
                    System.out.print("Enter customer area: ");
                    String nothing24 = scanner.nextLine();
                    String customerArea1 = scanner.nextLine();
                    System.out.print("Enter customer state: ");
                    String customerState1 = scanner.nextLine();
                    System.out.print("Enter customer region: ");
                    String customerRegion1 = scanner.nextLine();
                    System.out.print("Enter customer continent: ");
                    String customerContinent1 = scanner.nextLine();
                    System.out.print("Enter customer country: ");
                    String customerCountry1 = scanner.nextLine();
                    person = new Person(customerName1, customerPhone1, customerEmail1, customerID1, customerMoney1, customerDay1, customerMonth1, customerYear1, customerHouse1, customerRoad1, customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1);
                    date = new Date(customerDay1, customerMonth1, customerYear1);
                    address = new Address(customerHouse1, customerRoad1, customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1);
                    peopleRecords.add(person);
                    addressLinkedHashing.add(address);
                    dateArrayHashing.add(date);
                    System.out.println("Does the customer have a room? ");
                    System.out.print("Answer: ");
                    String theAnswer = scanner.next();
                    if (theAnswer.equalsIgnoreCase("yes") || theAnswer.equalsIgnoreCase("yeah") || theAnswer.equalsIgnoreCase("ya")){
                        System.out.print("Enter room number: ");
                        int roomNumber5 = scanner.nextInt();
                        System.out.print("Enter floor number: ");
                        int floorNumber5 = scanner.nextInt();
                        System.out.println("Enter room description in one line: ");
                        String nothing25 = scanner.nextLine();
                        String roomDesc5 = scanner.nextLine();
                        customer = new Customer(customerName1, customerPhone1, customerEmail1, customerID1, customerMoney1, customerDay1, customerMonth1, customerYear1, customerHouse1, customerRoad1,customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1, roomNumber5, floorNumber5, roomDesc5);
                    }
                    else
                        customer = new Customer(customerName1, customerPhone1, customerEmail1, customerID1, customerMoney1, customerDay1, customerMonth1, customerYear1, customerHouse1, customerRoad1, customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1);
                    customerKWLinkedList.add(customer);
                    System.out.println("A customer have been added to the list.");
                }
                case 5 -> {
                    System.out.print("Enter customer name: ");
                    String nothing23 = scanner.nextLine();
                    String customerName1 = scanner.nextLine();
                    System.out.print("Enter customer phone number: ");
                    String customerPhone1 = scanner.nextLine();
                    System.out.print("Enter customer email: ");
                    String customerEmail1 = scanner.next();
                    System.out.print("Enter customer ID: ");
                    long customerID1 = scanner.nextLong();
                    System.out.println("How much money does the customer have? ");
                    System.out.print("Answer: ");
                    float customerMoney1 = scanner.nextFloat();
                    System.out.print("Enter customer birthDay: ");
                    int customerDay1 = scanner.nextInt();
                    System.out.print("Enter customer birthMonth: ");
                    int customerMonth1 = scanner.nextInt();
                    System.out.print("Enter customer birthYear: ");
                    int customerYear1 = scanner.nextInt();
                    System.out.print("Enter customer house number: ");
                    int customerHouse1 = scanner.nextInt();
                    System.out.print("Enter customer road number: ");
                    int customerRoad1 = scanner.nextInt();
                    System.out.print("Enter customer block number: ");
                    int customerBlock1 = scanner.nextInt();
                    System.out.print("Enter customer area: ");
                    String nothing24 = scanner.nextLine();
                    String customerArea1 = scanner.nextLine();
                    System.out.print("Enter customer state: ");
                    String customerState1 = scanner.nextLine();
                    System.out.print("Enter customer region: ");
                    String customerRegion1 = scanner.nextLine();
                    System.out.print("Enter customer continent: ");
                    String customerContinent1 = scanner.nextLine();
                    System.out.print("Enter customer country: ");
                    String customerCountry1 = scanner.nextLine();
                    person = new Person(customerName1, customerPhone1, customerEmail1, customerID1, customerMoney1, customerDay1, customerMonth1, customerYear1, customerHouse1, customerRoad1, customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1);
                    date = new Date(customerDay1, customerMonth1, customerYear1);
                    address = new Address(customerHouse1, customerRoad1, customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1);
                    peopleRecords.add(person);
                    addressLinkedHashing.add(address);
                    dateArrayHashing.add(date);
                    System.out.println("Does the customer have a room? ");
                    System.out.print("Answer: ");
                    String theAnswer = scanner.next();
                    if (theAnswer.equalsIgnoreCase("yes") || theAnswer.equalsIgnoreCase("yeah") || theAnswer.equalsIgnoreCase("ya")){
                        System.out.print("Enter room number: ");
                        int roomNumber5 = scanner.nextInt();
                        System.out.print("Enter floor number: ");
                        int floorNumber5 = scanner.nextInt();
                        System.out.println("Enter room description in one line: ");
                        String nothing25 = scanner.nextLine();
                        String roomDesc5 = scanner.nextLine();
                        customer = new Customer(customerName1, customerPhone1, customerEmail1, customerID1, customerMoney1, customerDay1, customerMonth1, customerYear1, customerHouse1, customerRoad1,customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1, roomNumber5, floorNumber5, roomDesc5);
                    }
                    else
                        customer = new Customer(customerName1, customerPhone1, customerEmail1, customerID1, customerMoney1, customerDay1, customerMonth1, customerYear1, customerHouse1, customerRoad1, customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1);
                    if (customerKWLinkedList.remove(customer).equals(customer))
                        System.out.println("A customer have been successfully deleted from the list.");
                    else
                        System.out.println("Failed to delete a customer from the list successfully!");
                }
                case 6 -> {
                    System.out.print("Enter customer name: ");
                    String nothing23 = scanner.nextLine();
                    String customerName1 = scanner.nextLine();
                    System.out.print("Enter customer phone number: ");
                    String customerPhone1 = scanner.nextLine();
                    System.out.print("Enter customer email: ");
                    String customerEmail1 = scanner.next();
                    System.out.print("Enter customer ID: ");
                    long customerID1 = scanner.nextLong();
                    System.out.println("How much money does the customer have? ");
                    System.out.print("Answer: ");
                    float customerMoney1 = scanner.nextFloat();
                    System.out.print("Enter customer birthDay: ");
                    int customerDay1 = scanner.nextInt();
                    System.out.print("Enter customer birthMonth: ");
                    int customerMonth1 = scanner.nextInt();
                    System.out.print("Enter customer birthYear: ");
                    int customerYear1 = scanner.nextInt();
                    System.out.print("Enter customer house number: ");
                    int customerHouse1 = scanner.nextInt();
                    System.out.print("Enter customer road number: ");
                    int customerRoad1 = scanner.nextInt();
                    System.out.print("Enter customer block number: ");
                    int customerBlock1 = scanner.nextInt();
                    System.out.print("Enter customer area: ");
                    String nothing24 = scanner.nextLine();
                    String customerArea1 = scanner.nextLine();
                    System.out.print("Enter customer state: ");
                    String customerState1 = scanner.nextLine();
                    System.out.print("Enter customer region: ");
                    String customerRegion1 = scanner.nextLine();
                    System.out.print("Enter customer continent: ");
                    String customerContinent1 = scanner.nextLine();
                    System.out.print("Enter customer country: ");
                    String customerCountry1 = scanner.nextLine();
                    person = new Person(customerName1, customerPhone1, customerEmail1, customerID1, customerMoney1, customerDay1, customerMonth1, customerYear1, customerHouse1, customerRoad1, customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1);
                    date = new Date(customerDay1, customerMonth1, customerYear1);
                    address = new Address(customerHouse1, customerRoad1, customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1);
                    peopleRecords.add(person);
                    addressLinkedHashing.add(address);
                    dateArrayHashing.add(date);
                    System.out.println("Does the customer have a room? ");
                    System.out.print("Answer: ");
                    String theAnswer = scanner.next();
                    if (theAnswer.equalsIgnoreCase("yes") || theAnswer.equalsIgnoreCase("yeah") || theAnswer.equalsIgnoreCase("ya")){
                        System.out.print("Enter room number: ");
                        int roomNumber5 = scanner.nextInt();
                        System.out.print("Enter floor number: ");
                        int floorNumber5 = scanner.nextInt();
                        System.out.println("Enter room description in one line: ");
                        String nothing25 = scanner.nextLine();
                        String roomDesc5 = scanner.nextLine();
                        customer = new Customer(customerName1, customerPhone1, customerEmail1, customerID1, customerMoney1, customerDay1, customerMonth1, customerYear1, customerHouse1, customerRoad1,customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1, roomNumber5, floorNumber5, roomDesc5);
                    }
                    else
                        customer = new Customer(customerName1, customerPhone1, customerEmail1, customerID1, customerMoney1, customerDay1, customerMonth1, customerYear1, customerHouse1, customerRoad1, customerBlock1, customerArea1, customerState1, customerRegion1, customerContinent1, customerCountry1);
                    int customerIndex = customerKWLinkedList.search(customer);
                    if (customerIndex > -1)
                        System.out.println("The customer is found in the list at index "+customerIndex);
                    else
                        System.out.println("Cannot find the customer from the list.");
                }
                case 7 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        System.out.print("Enter the index of customer list: ");
                        int customerIndex = scanner.nextInt();
                        System.out.println("Information found from the list: ");
                        System.out.println(customerKWLinkedList.get(customerIndex));
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 9 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        while (!customerKWLinkedList.isEmpty())
                            customerKWLinkedList.removeFirst();
                        System.out.println("All customers have been erased.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 12 -> manager.display();
                case 13 -> {
                    System.out.println("Enter your ID: ");
                    long managerID2 = scanner.nextLong();
                    if (manager.getID() == managerID2){
                        System.out.println("Do you have internet or not?");
                        String answering = scanner.next();
                        if (answering.equalsIgnoreCase("yes") || answering.equalsIgnoreCase("yeah") || answering.equalsIgnoreCase("ya")){
                            boolean founder = false;
                            System.out.print("Enter the name of the internet: ");
                            String netName = scanner.nextLine();
                            for (int i = 0; i < internetKWLinkedList.size(); i++)
                                if (internetKWLinkedList.get(i).getName().compareTo(netName) == 0){
                                    founder = true;
                                    internet = internetKWLinkedList.get(i);
                                    break;
                                }
                            if (founder){
                                System.out.print("Enter room number: ");
                                int roomNum2 = scanner.nextInt();
                                System.out.print("Enter floor number: ");
                                int floorNum2 = scanner.nextInt();
                                System.out.print("Enter number of cleaners for this room: ");
                                int roomCleaner2 = scanner.nextInt();
                                System.out.println("Enter room description in one line: ");
                                String nothing20 = scanner.nextLine();
                                String roomDesc2 = scanner.nextLine();
                                room = new Room(roomNum2, floorNum2, roomDesc2, internet.getName(), internet.getPasswordType(), internet.getPassword(), internet.getIpType(), internet.getIpAddress(), internet.getProvider(), internet.getOwner(), roomCleaner2, manager);
                                roomSingleLinkedList.addLast(room);
                                System.out.println("A room have been added to the list successfully.");
                                System.out.println("Would you like to edit your network?");
                                System.out.print("Answer: ");
                                String answerer = scanner.next();
                                if (answerer.equalsIgnoreCase("yes") || answerer.equalsIgnoreCase("yeah") || answerer.equalsIgnoreCase("ya")){
                                    System.out.print("Enter internet name: ");
                                    String internetName5 = scanner.nextLine();
                                    System.out.print("Enter internet password type: ");
                                    String internetPassType5 = scanner.next();
                                    System.out.print("Enter internet password: ");
                                    String internetPass5 = scanner.nextLine();
                                    System.out.print("Enter internet ip address: ");
                                    String internetAddress5 = scanner.next();
                                    System.out.print("Enter internet ip type: ");
                                    String internetIPType5 = scanner.next();
                                    Person roomHandler = new Person(manager.getName(), manager.getPhone(), manager.getEmail(), managerID2, manager.getMoney(), manager.getBirthDate().getDay(), manager.getBirthDate().getMonth(), manager.getBirthDate().getYear(), manager.getAddress().getHouse(), manager.getAddress().getRoad(), manager.getAddress().getBlock(), manager.getAddress().getArea(), manager.getAddress().getState(), manager.getAddress().getRegion(), manager.getAddress().getContinent(), manager.getAddress().getCountry());
                                    System.out.print("Enter internet provider name: ");
                                    String providerName5 = scanner.nextLine();
                                    System.out.print("Enter internet provider phone number: ");
                                    String providerPhone5 = scanner.nextLine();
                                    System.out.print("Enter internet provider email: ");
                                    String providerEmail5 = scanner.next();
                                    System.out.print("Enter internet provider ID: ");
                                    long providerID5 = scanner.nextLong();
                                    System.out.println("How much money does the provider have?");
                                    System.out.print("Answer: ");
                                    float providerMoney5 = scanner.nextFloat();
                                    System.out.print("Enter internet provider birthDay: ");
                                    int providerDay5 = scanner.nextInt();
                                    System.out.print("Enter internet provider birthMonth: ");
                                    int providerMonth5 = scanner.nextInt();
                                    System.out.print("Enter internet provider birthYear: ");
                                    int providerYear5 = scanner.nextInt();
                                    System.out.print("Enter internet provider house number: ");
                                    int providerHouse5 = scanner.nextInt();
                                    System.out.print("Enter internet provider road number: ");
                                    int providerRoad5 = scanner.nextInt();
                                    System.out.print("Enter internet provider block number: ");
                                    int providerBlock5 = scanner.nextInt();
                                    System.out.print("Enter internet provider area: ");
                                    String nothing22 = scanner.nextLine();
                                    String providerArea5 = scanner.nextLine();
                                    System.out.print("Enter internet provider state: ");
                                    String providerState5 = scanner.nextLine();
                                    System.out.print("Enter internet provider region: ");
                                    String providerRegion5 = scanner.nextLine();
                                    System.out.print("Enter internet provider continent: ");
                                    String providerContinent5 = scanner.nextLine();
                                    System.out.println("Enter internet provider country: ");
                                    String providerCountry5 = scanner.nextLine();
                                    Person provider = new Person(providerName5, providerPhone5, providerEmail5, providerID5, providerMoney5, providerDay5, providerMonth5, providerYear5, providerHouse5, providerRoad5, providerBlock5, providerArea5, providerState5, providerRegion5, providerContinent5, providerCountry5);
                                    Room backup1 = room;
                                    room.setNetworkInformation(internetName5, internetPassType5, internetPass5, internetIPType5, internetAddress5, provider, roomHandler);
                                    roomSingleLinkedList.set(roomSingleLinkedList.indexOf(backup1), room);
                                    System.out.println("The room internet has been changed.");
                                }
                                else
                                    System.out.println("Thank you for adding a room to the list anyways!");
                            }
                            else {
                                System.out.print("Enter room number: ");
                                int roomNum3 = scanner.nextInt();
                                System.out.print("Enter floor number: ");
                                int floorNum3 = scanner.nextInt();
                                System.out.print("Enter number of cleaners for this room: ");
                                int roomCleaner3 = scanner.nextInt();
                                System.out.println("Enter room description in one line: ");
                                String nothing20 = scanner.nextLine();
                                String roomDesc3 = scanner.nextLine();
                                System.out.print("Enter internet name: ");
                                String internetName5 = scanner.nextLine();
                                System.out.print("Enter internet password type: ");
                                String internetPassType5 = scanner.next();
                                System.out.print("Enter internet password: ");
                                String internetPass5 = scanner.nextLine();
                                System.out.print("Enter internet ip address: ");
                                String internetAddress5 = scanner.next();
                                System.out.print("Enter internet ip type: ");
                                String internetIPType5 = scanner.next();
                                Person roomHandler = new Person(manager.getName(), manager.getPhone(), manager.getEmail(), managerID2, manager.getMoney(), manager.getBirthDate().getDay(), manager.getBirthDate().getMonth(), manager.getBirthDate().getYear(), manager.getAddress().getHouse(), manager.getAddress().getRoad(), manager.getAddress().getBlock(), manager.getAddress().getArea(), manager.getAddress().getState(), manager.getAddress().getRegion(), manager.getAddress().getContinent(), manager.getAddress().getCountry());
                                System.out.print("Enter internet provider name: ");
                                String providerName5 = scanner.nextLine();
                                System.out.print("Enter internet provider phone number: ");
                                String providerPhone5 = scanner.nextLine();
                                System.out.print("Enter internet provider email: ");
                                String providerEmail5 = scanner.next();
                                System.out.print("Enter internet provider ID: ");
                                long providerID5 = scanner.nextLong();
                                System.out.println("How much money does the provider have?");
                                System.out.print("Answer: ");
                                float providerMoney5 = scanner.nextFloat();
                                System.out.print("Enter internet provider birthDay: ");
                                int providerDay5 = scanner.nextInt();
                                System.out.print("Enter internet provider birthMonth: ");
                                int providerMonth5 = scanner.nextInt();
                                System.out.print("Enter internet provider birthYear: ");
                                int providerYear5 = scanner.nextInt();
                                System.out.print("Enter internet provider house number: ");
                                int providerHouse5 = scanner.nextInt();
                                System.out.print("Enter internet provider road number: ");
                                int providerRoad5 = scanner.nextInt();
                                System.out.print("Enter internet provider block number: ");
                                int providerBlock5 = scanner.nextInt();
                                System.out.print("Enter internet provider area: ");
                                String nothing22 = scanner.nextLine();
                                String providerArea5 = scanner.nextLine();
                                System.out.print("Enter internet provider state: ");
                                String providerState5 = scanner.nextLine();
                                System.out.print("Enter internet provider region: ");
                                String providerRegion5 = scanner.nextLine();
                                System.out.print("Enter internet provider continent: ");
                                String providerContinent5 = scanner.nextLine();
                                System.out.println("Enter internet provider country: ");
                                String providerCountry5 = scanner.nextLine();
                                Person provider = new Person(providerName5, providerPhone5, providerEmail5, providerID5, providerMoney5, providerDay5, providerMonth5, providerYear5, providerHouse5, providerRoad5, providerBlock5, providerArea5, providerState5, providerRegion5, providerContinent5, providerCountry5);
                                room = new Room(roomNum3, floorNum3, roomDesc3, internetName5, internetPassType5, internetPass5, internetIPType5, internetAddress5, provider, roomHandler, roomCleaner3, manager);
                                roomSingleLinkedList.addFirst(room);
                                System.out.println("A room have been added to the list successfully.");
                            }
                        }
                        else {
                            System.out.print("Enter room number: ");
                            int roomNum1 = scanner.nextInt();
                            System.out.print("Enter floor number: ");
                            int floorNum1 = scanner.nextInt();
                            System.out.print("Enter number of cleaners for this room: ");
                            int roomCleaner1 = scanner.nextInt();
                            System.out.println("Enter room description in one line: ");
                            String nothing20 = scanner.nextLine();
                            String roomDesc1 = scanner.nextLine();
                            room = new Room(roomNum1, floorNum1, roomDesc1, manager, roomCleaner1);
                            roomSingleLinkedList.add(room, 1);
                            System.out.println("A room have been added successfully.");
                        }
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 14 -> {
                    System.out.println("Enter your ID: ");
                    long managerID2 = scanner.nextLong();
                    if (manager.getID() == managerID2){
                        System.out.println("Do you have internet or not?");
                        String answering = scanner.next();
                        if (answering.equalsIgnoreCase("yes") || answering.equalsIgnoreCase("yeah") || answering.equalsIgnoreCase("ya")){
                            boolean founder = false;
                            System.out.print("Enter the name of the internet: ");
                            String netName = scanner.nextLine();
                            for (int i = 0; i < internetKWLinkedList.size(); i++)
                                if (internetKWLinkedList.get(i).getName().compareTo(netName) == 0){
                                    founder = true;
                                    internet = internetKWLinkedList.get(i);
                                    break;
                                }
                            if (founder){
                                System.out.print("Enter room number: ");
                                int roomNum2 = scanner.nextInt();
                                System.out.print("Enter floor number: ");
                                int floorNum2 = scanner.nextInt();
                                System.out.print("Enter number of cleaners for this room: ");
                                int roomCleaner2 = scanner.nextInt();
                                System.out.println("Enter room description in one line: ");
                                String nothing20 = scanner.nextLine();
                                String roomDesc2 = scanner.nextLine();
                                room = new Room(roomNum2, floorNum2, roomDesc2, internet.getName(), internet.getPasswordType(), internet.getPassword(), internet.getIpType(), internet.getIpAddress(), internet.getProvider(), internet.getOwner(), roomCleaner2, manager);
                                if (roomSingleLinkedList.remove(room).equals(room)) {
                                    System.out.println("A room have been deleted from the list successfully.");
                                    System.out.println("Would you like to edit your network?");
                                    System.out.print("Answer: ");
                                    String answerer = scanner.next();
                                    if (answerer.equalsIgnoreCase("yes") || answerer.equalsIgnoreCase("yeah") || answerer.equalsIgnoreCase("ya")){
                                        System.out.print("Enter internet name: ");
                                        String internetName5 = scanner.nextLine();
                                        System.out.print("Enter internet password type: ");
                                        String internetPassType5 = scanner.next();
                                        System.out.print("Enter internet password: ");
                                        String internetPass5 = scanner.nextLine();
                                        System.out.print("Enter internet ip address: ");
                                        String internetAddress5 = scanner.next();
                                        System.out.print("Enter internet ip type: ");
                                        String internetIPType5 = scanner.next();
                                        Person roomHandler = new Person(manager.getName(), manager.getPhone(), manager.getEmail(), managerID2, manager.getMoney(), manager.getBirthDate().getDay(), manager.getBirthDate().getMonth(), manager.getBirthDate().getYear(), manager.getAddress().getHouse(), manager.getAddress().getRoad(), manager.getAddress().getBlock(), manager.getAddress().getArea(), manager.getAddress().getState(), manager.getAddress().getRegion(), manager.getAddress().getContinent(), manager.getAddress().getCountry());
                                        System.out.print("Enter internet provider name: ");
                                        String providerName5 = scanner.nextLine();
                                        System.out.print("Enter internet provider phone number: ");
                                        String providerPhone5 = scanner.nextLine();
                                        System.out.print("Enter internet provider email: ");
                                        String providerEmail5 = scanner.next();
                                        System.out.print("Enter internet provider ID: ");
                                        long providerID5 = scanner.nextLong();
                                        System.out.println("How much money does the provider have?");
                                        System.out.print("Answer: ");
                                        float providerMoney5 = scanner.nextFloat();
                                        System.out.print("Enter internet provider birthDay: ");
                                        int providerDay5 = scanner.nextInt();
                                        System.out.print("Enter internet provider birthMonth: ");
                                        int providerMonth5 = scanner.nextInt();
                                        System.out.print("Enter internet provider birthYear: ");
                                        int providerYear5 = scanner.nextInt();
                                        System.out.print("Enter internet provider house number: ");
                                        int providerHouse5 = scanner.nextInt();
                                        System.out.print("Enter internet provider road number: ");
                                        int providerRoad5 = scanner.nextInt();
                                        System.out.print("Enter internet provider block number: ");
                                        int providerBlock5 = scanner.nextInt();
                                        System.out.print("Enter internet provider area: ");
                                        String nothing22 = scanner.nextLine();
                                        String providerArea5 = scanner.nextLine();
                                        System.out.print("Enter internet provider state: ");
                                        String providerState5 = scanner.nextLine();
                                        System.out.print("Enter internet provider region: ");
                                        String providerRegion5 = scanner.nextLine();
                                        System.out.print("Enter internet provider continent: ");
                                        String providerContinent5 = scanner.nextLine();
                                        System.out.println("Enter internet provider country: ");
                                        String providerCountry5 = scanner.nextLine();
                                        Person provider = new Person(providerName5, providerPhone5, providerEmail5, providerID5, providerMoney5, providerDay5, providerMonth5, providerYear5, providerHouse5, providerRoad5, providerBlock5, providerArea5, providerState5, providerRegion5, providerContinent5, providerCountry5);
                                        Room backup1 = room;
                                        room.setNetworkInformation(internetName5, internetPassType5, internetPass5, internetIPType5, internetAddress5, provider, roomHandler);
                                        roomSingleLinkedList.set(roomSingleLinkedList.indexOf(backup1), room);
                                        System.out.println("The room internet has been changed.");
                                    }
                                    else
                                        System.out.println("Thank you for deleting a room from the list anyways!");
                                }
                                else
                                    System.out.println("Failed to delete a room from the list successfully.");
                            }
                            else {
                                System.out.print("Enter room number: ");
                                int roomNum3 = scanner.nextInt();
                                System.out.print("Enter floor number: ");
                                int floorNum3 = scanner.nextInt();
                                System.out.print("Enter number of cleaners for this room: ");
                                int roomCleaner3 = scanner.nextInt();
                                System.out.println("Enter room description in one line: ");
                                String nothing20 = scanner.nextLine();
                                String roomDesc3 = scanner.nextLine();
                                System.out.print("Enter internet name: ");
                                String internetName5 = scanner.nextLine();
                                System.out.print("Enter internet password type: ");
                                String internetPassType5 = scanner.next();
                                System.out.print("Enter internet password: ");
                                String internetPass5 = scanner.nextLine();
                                System.out.print("Enter internet ip address: ");
                                String internetAddress5 = scanner.next();
                                System.out.print("Enter internet ip type: ");
                                String internetIPType5 = scanner.next();
                                Person roomHandler = new Person(manager.getName(), manager.getPhone(), manager.getEmail(), managerID2, manager.getMoney(), manager.getBirthDate().getDay(), manager.getBirthDate().getMonth(), manager.getBirthDate().getYear(), manager.getAddress().getHouse(), manager.getAddress().getRoad(), manager.getAddress().getBlock(), manager.getAddress().getArea(), manager.getAddress().getState(), manager.getAddress().getRegion(), manager.getAddress().getContinent(), manager.getAddress().getCountry());
                                System.out.print("Enter internet provider name: ");
                                String providerName5 = scanner.nextLine();
                                System.out.print("Enter internet provider phone number: ");
                                String providerPhone5 = scanner.nextLine();
                                System.out.print("Enter internet provider email: ");
                                String providerEmail5 = scanner.next();
                                System.out.print("Enter internet provider ID: ");
                                long providerID5 = scanner.nextLong();
                                System.out.println("How much money does the provider have?");
                                System.out.print("Answer: ");
                                float providerMoney5 = scanner.nextFloat();
                                System.out.print("Enter internet provider birthDay: ");
                                int providerDay5 = scanner.nextInt();
                                System.out.print("Enter internet provider birthMonth: ");
                                int providerMonth5 = scanner.nextInt();
                                System.out.print("Enter internet provider birthYear: ");
                                int providerYear5 = scanner.nextInt();
                                System.out.print("Enter internet provider house number: ");
                                int providerHouse5 = scanner.nextInt();
                                System.out.print("Enter internet provider road number: ");
                                int providerRoad5 = scanner.nextInt();
                                System.out.print("Enter internet provider block number: ");
                                int providerBlock5 = scanner.nextInt();
                                System.out.print("Enter internet provider area: ");
                                String nothing22 = scanner.nextLine();
                                String providerArea5 = scanner.nextLine();
                                System.out.print("Enter internet provider state: ");
                                String providerState5 = scanner.nextLine();
                                System.out.print("Enter internet provider region: ");
                                String providerRegion5 = scanner.nextLine();
                                System.out.print("Enter internet provider continent: ");
                                String providerContinent5 = scanner.nextLine();
                                System.out.println("Enter internet provider country: ");
                                String providerCountry5 = scanner.nextLine();
                                Person provider = new Person(providerName5, providerPhone5, providerEmail5, providerID5, providerMoney5, providerDay5, providerMonth5, providerYear5, providerHouse5, providerRoad5, providerBlock5, providerArea5, providerState5, providerRegion5, providerContinent5, providerCountry5);
                                room = new Room(roomNum3, floorNum3, roomDesc3, internetName5, internetPassType5, internetPass5, internetIPType5, internetAddress5, provider, roomHandler, roomCleaner3, manager);
                                if (roomSingleLinkedList.remove(room).equals(room))
                                    System.out.println("A room have been deleted from the list successfully.");
                                else
                                    System.out.println("Failed to delete a room from the list successfully.");
                            }
                        }
                        else {
                            System.out.print("Enter room number: ");
                            int roomNum1 = scanner.nextInt();
                            System.out.print("Enter floor number: ");
                            int floorNum1 = scanner.nextInt();
                            System.out.print("Enter number of cleaners for this room: ");
                            int roomCleaner1 = scanner.nextInt();
                            System.out.println("Enter room description in one line: ");
                            String nothing20 = scanner.nextLine();
                            String roomDesc1 = scanner.nextLine();
                            room = new Room(roomNum1, floorNum1, roomDesc1, manager, roomCleaner1);
                            if (roomSingleLinkedList.remove(room).equals(room))
                                System.out.println("A room have been deleted from the list successfully.");
                            else
                                System.out.println("Failed to delete a room from the list successfully.");
                        }
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 15 -> {
                    System.out.println("Enter your ID: ");
                    long managerID2 = scanner.nextLong();
                    if (manager.getID() == managerID2){
                        System.out.println("Do you have internet or not?");
                        String answering = scanner.next();
                        if (answering.equalsIgnoreCase("yes") || answering.equalsIgnoreCase("yeah") || answering.equalsIgnoreCase("ya")){
                            boolean founder = false;
                            System.out.print("Enter the name of the internet: ");
                            String netName = scanner.nextLine();
                            for (int i = 0; i < internetKWLinkedList.size(); i++)
                                if (internetKWLinkedList.get(i).getName().compareTo(netName) == 0){
                                    founder = true;
                                    internet = internetKWLinkedList.get(i);
                                    break;
                                }
                            if (founder){
                                System.out.print("Enter room number: ");
                                int roomNum2 = scanner.nextInt();
                                System.out.print("Enter floor number: ");
                                int floorNum2 = scanner.nextInt();
                                System.out.print("Enter number of cleaners for this room: ");
                                int roomCleaner2 = scanner.nextInt();
                                System.out.println("Enter room description in one line: ");
                                String nothing20 = scanner.nextLine();
                                String roomDesc2 = scanner.nextLine();
                                room = new Room(roomNum2, floorNum2, roomDesc2, internet.getName(), internet.getPasswordType(), internet.getPassword(), internet.getIpType(), internet.getIpAddress(), internet.getProvider(), internet.getOwner(), roomCleaner2, manager);
                                int index3 = roomSingleLinkedList.search(room);
                                if (index3 > -1) {
                                    System.out.println("The room is found in the list at index " + index3);
                                    System.out.println("Would you like to edit your network?");
                                    System.out.print("Answer: ");
                                    String answerer = scanner.next();
                                    if (answerer.equalsIgnoreCase("yes") || answerer.equalsIgnoreCase("yeah") || answerer.equalsIgnoreCase("ya")){
                                        System.out.print("Enter internet name: ");
                                        String internetName5 = scanner.nextLine();
                                        System.out.print("Enter internet password type: ");
                                        String internetPassType5 = scanner.next();
                                        System.out.print("Enter internet password: ");
                                        String internetPass5 = scanner.nextLine();
                                        System.out.print("Enter internet ip address: ");
                                        String internetAddress5 = scanner.next();
                                        System.out.print("Enter internet ip type: ");
                                        String internetIPType5 = scanner.next();
                                        Person roomHandler = new Person(manager.getName(), manager.getPhone(), manager.getEmail(), managerID2, manager.getMoney(), manager.getBirthDate().getDay(), manager.getBirthDate().getMonth(), manager.getBirthDate().getYear(), manager.getAddress().getHouse(), manager.getAddress().getRoad(), manager.getAddress().getBlock(), manager.getAddress().getArea(), manager.getAddress().getState(), manager.getAddress().getRegion(), manager.getAddress().getContinent(), manager.getAddress().getCountry());
                                        System.out.print("Enter internet provider name: ");
                                        String providerName5 = scanner.nextLine();
                                        System.out.print("Enter internet provider phone number: ");
                                        String providerPhone5 = scanner.nextLine();
                                        System.out.print("Enter internet provider email: ");
                                        String providerEmail5 = scanner.next();
                                        System.out.print("Enter internet provider ID: ");
                                        long providerID5 = scanner.nextLong();
                                        System.out.println("How much money does the provider have?");
                                        System.out.print("Answer: ");
                                        float providerMoney5 = scanner.nextFloat();
                                        System.out.print("Enter internet provider birthDay: ");
                                        int providerDay5 = scanner.nextInt();
                                        System.out.print("Enter internet provider birthMonth: ");
                                        int providerMonth5 = scanner.nextInt();
                                        System.out.print("Enter internet provider birthYear: ");
                                        int providerYear5 = scanner.nextInt();
                                        System.out.print("Enter internet provider house number: ");
                                        int providerHouse5 = scanner.nextInt();
                                        System.out.print("Enter internet provider road number: ");
                                        int providerRoad5 = scanner.nextInt();
                                        System.out.print("Enter internet provider block number: ");
                                        int providerBlock5 = scanner.nextInt();
                                        System.out.print("Enter internet provider area: ");
                                        String nothing22 = scanner.nextLine();
                                        String providerArea5 = scanner.nextLine();
                                        System.out.print("Enter internet provider state: ");
                                        String providerState5 = scanner.nextLine();
                                        System.out.print("Enter internet provider region: ");
                                        String providerRegion5 = scanner.nextLine();
                                        System.out.print("Enter internet provider continent: ");
                                        String providerContinent5 = scanner.nextLine();
                                        System.out.println("Enter internet provider country: ");
                                        String providerCountry5 = scanner.nextLine();
                                        Person provider = new Person(providerName5, providerPhone5, providerEmail5, providerID5, providerMoney5, providerDay5, providerMonth5, providerYear5, providerHouse5, providerRoad5, providerBlock5, providerArea5, providerState5, providerRegion5, providerContinent5, providerCountry5);
                                        Room backup2 = room;
                                        room.setNetworkInformation(internetName5, internetPassType5, internetPass5, internetIPType5, internetAddress5, provider, roomHandler);
                                        roomSingleLinkedList.set(roomSingleLinkedList.indexOf(backup2), room);
                                        System.out.println("The room internet has been changed.");
                                    }
                                    else
                                        System.out.println("Thank you for searching for a room from the list anyways!");
                                }
                                else
                                    System.out.println("Cannot find the room from the list.");
                            }
                            else {
                                System.out.print("Enter room number: ");
                                int roomNum3 = scanner.nextInt();
                                System.out.print("Enter floor number: ");
                                int floorNum3 = scanner.nextInt();
                                System.out.print("Enter number of cleaners for this room: ");
                                int roomCleaner3 = scanner.nextInt();
                                System.out.println("Enter room description in one line: ");
                                String nothing20 = scanner.nextLine();
                                String roomDesc3 = scanner.nextLine();
                                System.out.print("Enter internet name: ");
                                String internetName5 = scanner.nextLine();
                                System.out.print("Enter internet password type: ");
                                String internetPassType5 = scanner.next();
                                System.out.print("Enter internet password: ");
                                String internetPass5 = scanner.nextLine();
                                System.out.print("Enter internet ip address: ");
                                String internetAddress5 = scanner.next();
                                System.out.print("Enter internet ip type: ");
                                String internetIPType5 = scanner.next();
                                Person roomHandler = new Person(manager.getName(), manager.getPhone(), manager.getEmail(), managerID2, manager.getMoney(), manager.getBirthDate().getDay(), manager.getBirthDate().getMonth(), manager.getBirthDate().getYear(), manager.getAddress().getHouse(), manager.getAddress().getRoad(), manager.getAddress().getBlock(), manager.getAddress().getArea(), manager.getAddress().getState(), manager.getAddress().getRegion(), manager.getAddress().getContinent(), manager.getAddress().getCountry());
                                System.out.print("Enter internet provider name: ");
                                String providerName5 = scanner.nextLine();
                                System.out.print("Enter internet provider phone number: ");
                                String providerPhone5 = scanner.nextLine();
                                System.out.print("Enter internet provider email: ");
                                String providerEmail5 = scanner.next();
                                System.out.print("Enter internet provider ID: ");
                                long providerID5 = scanner.nextLong();
                                System.out.println("How much money does the provider have?");
                                System.out.print("Answer: ");
                                float providerMoney5 = scanner.nextFloat();
                                System.out.print("Enter internet provider birthDay: ");
                                int providerDay5 = scanner.nextInt();
                                System.out.print("Enter internet provider birthMonth: ");
                                int providerMonth5 = scanner.nextInt();
                                System.out.print("Enter internet provider birthYear: ");
                                int providerYear5 = scanner.nextInt();
                                System.out.print("Enter internet provider house number: ");
                                int providerHouse5 = scanner.nextInt();
                                System.out.print("Enter internet provider road number: ");
                                int providerRoad5 = scanner.nextInt();
                                System.out.print("Enter internet provider block number: ");
                                int providerBlock5 = scanner.nextInt();
                                System.out.print("Enter internet provider area: ");
                                String nothing22 = scanner.nextLine();
                                String providerArea5 = scanner.nextLine();
                                System.out.print("Enter internet provider state: ");
                                String providerState5 = scanner.nextLine();
                                System.out.print("Enter internet provider region: ");
                                String providerRegion5 = scanner.nextLine();
                                System.out.print("Enter internet provider continent: ");
                                String providerContinent5 = scanner.nextLine();
                                System.out.println("Enter internet provider country: ");
                                String providerCountry5 = scanner.nextLine();
                                Person provider = new Person(providerName5, providerPhone5, providerEmail5, providerID5, providerMoney5, providerDay5, providerMonth5, providerYear5, providerHouse5, providerRoad5, providerBlock5, providerArea5, providerState5, providerRegion5, providerContinent5, providerCountry5);
                                room = new Room(roomNum3, floorNum3, roomDesc3, internetName5, internetPassType5, internetPass5, internetIPType5, internetAddress5, provider, roomHandler, roomCleaner3, manager);
                                int index2 = roomSingleLinkedList.search(room);
                                if (index2 > -1)
                                    System.out.println("The room is found in the list at index "+index2);
                                else
                                    System.out.println("Cannot find the room from the list.");
                            }
                        }
                        else {
                            System.out.print("Enter room number: ");
                            int roomNum1 = scanner.nextInt();
                            System.out.print("Enter floor number: ");
                            int floorNum1 = scanner.nextInt();
                            System.out.print("Enter number of cleaners for this room: ");
                            int roomCleaner1 = scanner.nextInt();
                            System.out.println("Enter room description in one line: ");
                            String nothing20 = scanner.nextLine();
                            String roomDesc1 = scanner.nextLine();
                            room = new Room(roomNum1, floorNum1, roomDesc1, manager, roomCleaner1);
                            int index1 = roomSingleLinkedList.search(room);
                            if (index1 > -1)
                                System.out.println("The room is found in the list at index "+index1);
                            else
                                System.out.println("Cannot find the room from the list.");
                        }
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 16 -> {
                    System.out.print("Enter the index of room list: ");
                    int roomIndex = scanner.nextInt();
                    System.out.println("Information found from the list: ");
                    System.out.println(roomSingleLinkedList.get(roomIndex));
                }
                case 18 -> {
                    boolean found = false;
                    System.out.print("Enter your ID: ");
                    long onlyCustomer = scanner.nextLong();
                    for (int p = 0; p < customerKWLinkedList.size(); p++)
                        if (customerKWLinkedList.get(p).getID() == onlyCustomer){
                            found = true;
                            customer = customerKWLinkedList.get(p);
                            break;
                        }
                    if (found){
                        System.out.println("Choose the option below:");
                        System.out.println("(0) Cancel");
                        System.out.println("(1) Check in");
                        System.out.println("(2) Check out");
                        System.out.print("Answer: ");
                        int roomOption = scanner.nextInt();
                        if (roomOption == 1){
                            System.out.println("Do you have money dear customer?");
                            System.out.print("Answer: ");
                            String answering = scanner.next();
                            if (answering.equalsIgnoreCase("yes") || answering.equalsIgnoreCase("yeah") || answering.equalsIgnoreCase("ya")){
                                System.out.println("Select the room for booking: ");
                                roomSingleLinkedList.display();
                                System.out.print("Answer by entering the index (number) from the list: ");
                                int onlyNum = scanner.nextInt();
                                room = roomSingleLinkedList.get(onlyNum);
                                System.out.println("How many days will you stay in this room?");
                                System.out.print("Answer: ");
                                int numOfStay = scanner.nextInt();
                                System.out.println("The room cost "+numOfStay+" BD.");
                                System.out.println("You have "+customer.getMoney()+" BD.");
                                System.out.println("Would you like to pay? ");
                                System.out.print("Answer: ");
                                String answerer = scanner.next();
                                if (answerer.equalsIgnoreCase("yes") || answerer.equalsIgnoreCase("yeah") || answerer.equalsIgnoreCase("ya")){
                                    float realMoney = customer.getMoney() - (float)numOfStay;
                                    customer.setMoney(realMoney);
                                    room.setOwner(customer.getName(), customer.getPhone(), customer.getEmail(), customer.getID(), customer.getMoney(), customer.getBirthDate().getDay(), customer.getBirthDate().getMonth(), customer.getBirthDate().getYear(), customer.getAddress().getHouse(), customer.getAddress().getRoad(), customer.getAddress().getBlock(), customer.getAddress().getArea(), customer.getAddress().getState(), customer.getAddress().getRegion(), customer.getAddress().getContinent(), customer.getAddress().getCountry(), room.getRoomNumber(), room.getFloorNumber(), room.getDescription());
                                    System.out.println("Thank you for paying for the room!");
                                    bookings.push(customer.checkIn(room.getRoomNumber(), room.getFloorNumber(), room.getDescription()));
                                    removedRooms.add(roomSingleLinkedList.remove(room));
                                    System.out.println("Booking have been made successfully!");
                                    System.out.println("Thank you for booking a room at AQWE hotel!");
                                    System.out.println("We will contact you through your email "+customer.getEmail()+" and your phone number "+customer.getPhone());
                                }
                            }
                        }
                        else if (roomOption == 2){
                            boolean found1 = false;
                            System.out.print("Enter room number: ");
                            int roomNum = scanner.nextInt();
                            System.out.print("Enter floor number: ");
                            int floorNum = scanner.nextInt();
                            for (int i = 0; i < removedRooms.size(); i++)
                                if (removedRooms.get(i).getRoomNumber() == roomNum && removedRooms.get(i).getFloorNumber() == floorNum){
                                    found1 = true;
                                    room = removedRooms.get(i);
                                    break;
                                }
                            if (found1){
                                int getter;
                                System.out.println("Checkout status: "+customer.checkout(room));
                                String finder = bookings.peek();
                                String[] splitter = finder.split(" ");
                                for (int j = 0; j < splitter.length; j++) {
                                    if (splitter[j].compareTo("room") == 0 || splitter[j].compareTo("floor") == 0){
                                        getter = Integer.parseInt(splitter[j+1]);
                                        if (getter == roomNum || getter == floorNum)
                                            bookings.pop();
                                        else {
                                            pendingCheckout.add("You have been checked in to the room "+room.getRoomNumber()+" at floor "+room.getFloorNumber());
                                            pendingCheckoutIndex++;
                                        }
                                        break;
                                    }
                                }
                                boolean isDone = false;
                                for (int k = 0; k <= pendingCheckoutIndex; k++)
                                    if (pendingCheckout.get(k).compareTo(finder) == 0){
                                        isDone = true;
                                        bookings.pop();
                                        break;
                                    }
                                if (isDone){
                                    pendingCheckout.remove(finder);
                                    pendingCheckoutIndex--;
                                }
                                roomSingleLinkedList.add(room);
                                room.owner = new Customer();
                                System.out.println("You have been checked out from your room");
                            }
                        }
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a customer to access this feature.");
                        System.out.println("Contact manager to add you to this system.");
                    }
                }
                case 19 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        while (!roomSingleLinkedList.isEmpty())
                            roomSingleLinkedList.removeLast();
                        System.out.println("All rooms have been erased.");
                        while (!bookings.isEmpty())
                            bookings.pop();
                        while (!pendingCheckout.isEmpty()){
                            pendingCheckout.removeLast();
                            pendingCheckoutIndex--;
                        }
                        System.out.println("All bookings have been removed.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 20 -> {
                    System.out.print("Enter your ID: ");
                    long managerID2 = scanner.nextLong();
                    if (manager.getID() == managerID2){
                        System.out.print("Enter waiter name: ");
                        String nothing3 = scanner.nextLine();
                        String waiterName1 = scanner.nextLine();
                        System.out.print("Enter waiter phone number: ");
                        String waiterPhone1 = scanner.nextLine();
                        System.out.print("Enter waiter email: ");
                        String waiterEmail1 = scanner.next();
                        System.out.print("Enter waiter ID: ");
                        long waiterID1 = scanner.nextLong();
                        System.out.println("How much money does the waiter have? ");
                        System.out.print("Answer: ");
                        float waiterMoney1 = scanner.nextFloat();
                        System.out.print("Enter waiter birthDay: ");
                        int waiterDay1 = scanner.nextInt();
                        System.out.print("Enter waiter birthMonth: ");
                        int waiterMonth1 = scanner.nextInt();
                        System.out.print("Enter waiter birthYear: ");
                        int waiterYear1 = scanner.nextInt();
                        System.out.print("Enter waiter house number: ");
                        int waiterHouse1 = scanner.nextInt();
                        System.out.print("Enter waiter road number: ");
                        int waiterRoad1 = scanner.nextInt();
                        System.out.print("Enter waiter road number: ");
                        int waiterBlock1 = scanner.nextInt();
                        System.out.print("Enter waiter area: ");
                        String nothing4 = scanner.nextLine();
                        String waiterArea1 = scanner.nextLine();
                        System.out.print("Enter waiter state: ");
                        String waiterState1 = scanner.nextLine();
                        System.out.print("Enter waiter region: ");
                        String waiterRegion1 = scanner.nextLine();
                        System.out.print("Enter waiter continent: ");
                        String waiterContinent1 = scanner.nextLine();
                        System.out.print("Enter waiter country: ");
                        String waiterCountry1 = scanner.nextLine();
                        date = new Date(waiterDay1, waiterMonth1, waiterYear1);
                        address = new Address(waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                        dateArrayHashing.add(date);
                        addressLinkedHashing.add(address);
                        Person person3 = new Person(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                        peopleRecords.add(person3);
                        System.out.print("Enter waiter internet name: ");
                        String waiterNetName1 = scanner.nextLine();
                        System.out.print("Enter waiter internet password type: ");
                        String waiterNetPassType1 = scanner.next();
                        System.out.print("Enter waiter internet password: ");
                        String waiterNetPass1 = scanner.nextLine();
                        System.out.print("Enter waiter internet IP address: ");
                        String waiterNetIP1 = scanner.next();
                        System.out.print("Enter waiter internet IP type: ");
                        String waiterNetIPType1 = scanner.nextLine();
                        System.out.print("Enter internet provider name: ");
                        String providerName3 = scanner.nextLine();
                        System.out.print("Enter internet provider phone number: ");
                        String providerPhone3 = scanner.nextLine();
                        System.out.print("Enter internet provider email: ");
                        String providerEmail3 = scanner.next();
                        System.out.print("Enter internet provider ID: ");
                        long providerID3 = scanner.nextLong();
                        System.out.println("How much money does the provider have?");
                        System.out.print("Answer: ");
                        float providerMoney3 = scanner.nextFloat();
                        System.out.print("Enter internet provider birthDay: ");
                        int providerDay3 = scanner.nextInt();
                        System.out.print("Enter internet provider birthMonth: ");
                        int providerMonth3 = scanner.nextInt();
                        System.out.print("Enter internet provider birthYear: ");
                        int providerYear3 = scanner.nextInt();
                        System.out.print("Enter internet provider house number: ");
                        int providerHouse3 = scanner.nextInt();
                        System.out.print("Enter internet provider road number: ");
                        int providerRoad3 = scanner.nextInt();
                        System.out.print("Enter internet provider block number: ");
                        int providerBlock3 = scanner.nextInt();
                        System.out.print("Enter internet provider area: ");
                        String nothing5 = scanner.nextLine();
                        String providerArea3 = scanner.nextLine();
                        System.out.print("Enter internet provider state: ");
                        String providerState3 = scanner.nextLine();
                        System.out.print("Enter internet provider region: ");
                        String providerRegion3 = scanner.nextLine();
                        System.out.print("Enter internet provider continent: ");
                        String providerContinent3 = scanner.nextLine();
                        System.out.print("Enter internet provider country: ");
                        String providerCountry3 = scanner.nextLine();
                        date = new Date(providerDay3, providerMonth3, providerYear3);
                        address = new Address(providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                        dateArrayHashing.add(date);
                        addressLinkedHashing.add(address);
                        Person person4 = new Person(providerName3, providerPhone3, providerEmail3, providerID3, providerMoney3, providerDay3, providerMonth3, providerYear3, providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                        peopleRecords.add(person4);
                        waiter = new Waiter(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1, waiterNetName1, waiterNetPassType1, waiterNetPass1, waiterNetIP1, waiterNetIPType1, person4);
                        waiterSingleLinkedList.addLast(waiter);
                        System.out.println("Waiter have been added to the list successfully!");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 21 -> {
                    System.out.print("Enter your ID: ");
                    long managerID2 = scanner.nextLong();
                    if (manager.getID() == managerID2){
                        System.out.print("Enter waiter name: ");
                        String nothing3 = scanner.nextLine();
                        String waiterName1 = scanner.nextLine();
                        System.out.print("Enter waiter phone number: ");
                        String waiterPhone1 = scanner.nextLine();
                        System.out.print("Enter waiter email: ");
                        String waiterEmail1 = scanner.next();
                        System.out.print("Enter waiter ID: ");
                        long waiterID1 = scanner.nextLong();
                        System.out.println("How much money does the waiter have? ");
                        System.out.print("Answer: ");
                        float waiterMoney1 = scanner.nextFloat();
                        System.out.print("Enter waiter birthDay: ");
                        int waiterDay1 = scanner.nextInt();
                        System.out.print("Enter waiter birthMonth: ");
                        int waiterMonth1 = scanner.nextInt();
                        System.out.print("Enter waiter birthYear: ");
                        int waiterYear1 = scanner.nextInt();
                        System.out.print("Enter waiter house number: ");
                        int waiterHouse1 = scanner.nextInt();
                        System.out.print("Enter waiter road number: ");
                        int waiterRoad1 = scanner.nextInt();
                        System.out.print("Enter waiter road number: ");
                        int waiterBlock1 = scanner.nextInt();
                        System.out.print("Enter waiter area: ");
                        String nothing4 = scanner.nextLine();
                        String waiterArea1 = scanner.nextLine();
                        System.out.print("Enter waiter state: ");
                        String waiterState1 = scanner.nextLine();
                        System.out.print("Enter waiter region: ");
                        String waiterRegion1 = scanner.nextLine();
                        System.out.print("Enter waiter continent: ");
                        String waiterContinent1 = scanner.nextLine();
                        System.out.print("Enter waiter country: ");
                        String waiterCountry1 = scanner.nextLine();
                        date = new Date(waiterDay1, waiterMonth1, waiterYear1);
                        address = new Address(waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                        dateArrayHashing.add(date);
                        addressLinkedHashing.add(address);
                        Person person3 = new Person(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                        peopleRecords.add(person3);
                        System.out.print("Enter waiter internet name: ");
                        String waiterNetName1 = scanner.nextLine();
                        System.out.print("Enter waiter internet password type: ");
                        String waiterNetPassType1 = scanner.next();
                        System.out.print("Enter waiter internet password: ");
                        String waiterNetPass1 = scanner.nextLine();
                        System.out.print("Enter waiter internet IP address: ");
                        String waiterNetIP1 = scanner.next();
                        System.out.print("Enter waiter internet IP type: ");
                        String waiterNetIPType1 = scanner.nextLine();
                        System.out.print("Enter internet provider name: ");
                        String providerName3 = scanner.nextLine();
                        System.out.print("Enter internet provider phone number: ");
                        String providerPhone3 = scanner.nextLine();
                        System.out.print("Enter internet provider email: ");
                        String providerEmail3 = scanner.next();
                        System.out.print("Enter internet provider ID: ");
                        long providerID3 = scanner.nextLong();
                        System.out.println("How much money does the provider have?");
                        System.out.print("Answer: ");
                        float providerMoney3 = scanner.nextFloat();
                        System.out.print("Enter internet provider birthDay: ");
                        int providerDay3 = scanner.nextInt();
                        System.out.print("Enter internet provider birthMonth: ");
                        int providerMonth3 = scanner.nextInt();
                        System.out.print("Enter internet provider birthYear: ");
                        int providerYear3 = scanner.nextInt();
                        System.out.print("Enter internet provider house number: ");
                        int providerHouse3 = scanner.nextInt();
                        System.out.print("Enter internet provider road number: ");
                        int providerRoad3 = scanner.nextInt();
                        System.out.print("Enter internet provider block number: ");
                        int providerBlock3 = scanner.nextInt();
                        System.out.print("Enter internet provider area: ");
                        String nothing5 = scanner.nextLine();
                        String providerArea3 = scanner.nextLine();
                        System.out.print("Enter internet provider state: ");
                        String providerState3 = scanner.nextLine();
                        System.out.print("Enter internet provider region: ");
                        String providerRegion3 = scanner.nextLine();
                        System.out.print("Enter internet provider continent: ");
                        String providerContinent3 = scanner.nextLine();
                        System.out.print("Enter internet provider country: ");
                        String providerCountry3 = scanner.nextLine();
                        date = new Date(providerDay3, providerMonth3, providerYear3);
                        address = new Address(providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                        dateArrayHashing.add(date);
                        addressLinkedHashing.add(address);
                        Person person4 = new Person(providerName3, providerPhone3, providerEmail3, providerID3, providerMoney3, providerDay3, providerMonth3, providerYear3, providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                        peopleRecords.add(person4);
                        waiter = new Waiter(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1, waiterNetName1, waiterNetPassType1, waiterNetPass1, waiterNetIP1, waiterNetIPType1, person4);
                        if (waiterSingleLinkedList.remove(waiter).equals(waiter))
                            System.out.println("Waiter have been deleted successfully from the list.");
                        else
                            System.out.println("Failed to delete waiter successfully from the list.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 22 -> {
                    System.out.print("Enter your ID: ");
                    long managerID2 = scanner.nextLong();
                    if (manager.getID() == managerID2){
                        System.out.print("Enter waiter name: ");
                        String nothing3 = scanner.nextLine();
                        String waiterName1 = scanner.nextLine();
                        System.out.print("Enter waiter phone number: ");
                        String waiterPhone1 = scanner.nextLine();
                        System.out.print("Enter waiter email: ");
                        String waiterEmail1 = scanner.next();
                        System.out.print("Enter waiter ID: ");
                        long waiterID1 = scanner.nextLong();
                        System.out.println("How much money does the waiter have? ");
                        System.out.print("Answer: ");
                        float waiterMoney1 = scanner.nextFloat();
                        System.out.print("Enter waiter birthDay: ");
                        int waiterDay1 = scanner.nextInt();
                        System.out.print("Enter waiter birthMonth: ");
                        int waiterMonth1 = scanner.nextInt();
                        System.out.print("Enter waiter birthYear: ");
                        int waiterYear1 = scanner.nextInt();
                        System.out.print("Enter waiter house number: ");
                        int waiterHouse1 = scanner.nextInt();
                        System.out.print("Enter waiter road number: ");
                        int waiterRoad1 = scanner.nextInt();
                        System.out.print("Enter waiter road number: ");
                        int waiterBlock1 = scanner.nextInt();
                        System.out.print("Enter waiter area: ");
                        String nothing4 = scanner.nextLine();
                        String waiterArea1 = scanner.nextLine();
                        System.out.print("Enter waiter state: ");
                        String waiterState1 = scanner.nextLine();
                        System.out.print("Enter waiter region: ");
                        String waiterRegion1 = scanner.nextLine();
                        System.out.print("Enter waiter continent: ");
                        String waiterContinent1 = scanner.nextLine();
                        System.out.print("Enter waiter country: ");
                        String waiterCountry1 = scanner.nextLine();
                        date = new Date(waiterDay1, waiterMonth1, waiterYear1);
                        address = new Address(waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                        dateArrayHashing.add(date);
                        addressLinkedHashing.add(address);
                        Person person3 = new Person(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1);
                        peopleRecords.add(person3);
                        System.out.print("Enter waiter internet name: ");
                        String waiterNetName1 = scanner.nextLine();
                        System.out.print("Enter waiter internet password type: ");
                        String waiterNetPassType1 = scanner.next();
                        System.out.print("Enter waiter internet password: ");
                        String waiterNetPass1 = scanner.nextLine();
                        System.out.print("Enter waiter internet IP address: ");
                        String waiterNetIP1 = scanner.next();
                        System.out.print("Enter waiter internet IP type: ");
                        String waiterNetIPType1 = scanner.nextLine();
                        System.out.print("Enter internet provider name: ");
                        String providerName3 = scanner.nextLine();
                        System.out.print("Enter internet provider phone number: ");
                        String providerPhone3 = scanner.nextLine();
                        System.out.print("Enter internet provider email: ");
                        String providerEmail3 = scanner.next();
                        System.out.print("Enter internet provider ID: ");
                        long providerID3 = scanner.nextLong();
                        System.out.println("How much money does the provider have?");
                        System.out.print("Answer: ");
                        float providerMoney3 = scanner.nextFloat();
                        System.out.print("Enter internet provider birthDay: ");
                        int providerDay3 = scanner.nextInt();
                        System.out.print("Enter internet provider birthMonth: ");
                        int providerMonth3 = scanner.nextInt();
                        System.out.print("Enter internet provider birthYear: ");
                        int providerYear3 = scanner.nextInt();
                        System.out.print("Enter internet provider house number: ");
                        int providerHouse3 = scanner.nextInt();
                        System.out.print("Enter internet provider road number: ");
                        int providerRoad3 = scanner.nextInt();
                        System.out.print("Enter internet provider block number: ");
                        int providerBlock3 = scanner.nextInt();
                        System.out.print("Enter internet provider area: ");
                        String nothing5 = scanner.nextLine();
                        String providerArea3 = scanner.nextLine();
                        System.out.print("Enter internet provider state: ");
                        String providerState3 = scanner.nextLine();
                        System.out.print("Enter internet provider region: ");
                        String providerRegion3 = scanner.nextLine();
                        System.out.print("Enter internet provider continent: ");
                        String providerContinent3 = scanner.nextLine();
                        System.out.print("Enter internet provider country: ");
                        String providerCountry3 = scanner.nextLine();
                        date = new Date(providerDay3, providerMonth3, providerYear3);
                        address = new Address(providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                        dateArrayHashing.add(date);
                        addressLinkedHashing.add(address);
                        Person person4 = new Person(providerName3, providerPhone3, providerEmail3, providerID3, providerMoney3, providerDay3, providerMonth3, providerYear3, providerHouse3, providerRoad3, providerBlock3, providerArea3, providerState3, providerRegion3, providerContinent3, providerCountry3);
                        peopleRecords.add(person4);
                        waiter = new Waiter(waiterName1, waiterPhone1, waiterEmail1, waiterID1, waiterMoney1, waiterDay1, waiterMonth1, waiterYear1, waiterHouse1, waiterRoad1, waiterBlock1, waiterArea1, waiterState1, waiterRegion1, waiterContinent1, waiterCountry1, waiterNetName1, waiterNetPassType1, waiterNetPass1, waiterNetIP1, waiterNetIPType1, person4);
                        waiterSingleLinkedList.addLast(waiter);
                        int waiterIndex = waiterSingleLinkedList.search(waiter);
                        if (waiterIndex > -1)
                            System.out.println("Waiter is found in the list at index "+waiterIndex);
                        else
                            System.out.println("Waiter is not found in the list.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 23 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        System.out.print("Enter an index for waiter list: ");
                        int waterIndex = scanner.nextInt();
                        System.out.println("Information found from the list: ");
                        System.out.println(waiterSingleLinkedList.get(waterIndex));
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 25 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        while (!waiterSingleLinkedList.isEmpty())
                            waiterSingleLinkedList.removeFirst();
                        System.out.println("All waiters have been erased.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 26 -> {
                    System.out.print("Enter your ID: ");
                    long managerID2 = scanner.nextLong();
                    if (manager.getID() == managerID2){
                        System.out.print("Enter cleaner name: ");
                        String nothing18 = scanner.nextLine();
                        String cleanerName1 = scanner.nextLine();
                        System.out.print("Enter cleaner phone number: ");
                        String cleanerPhone1 = scanner.nextLine();
                        System.out.print("Enter cleaner email: ");
                        String cleanerEmail1 = scanner.next();
                        System.out.print("Enter cleaner ID: ");
                        long cleanerID1 = scanner.nextLong();
                        System.out.println("How much money does the cleaner have?");
                        System.out.print("Answer: ");
                        float cleanerMoney1 = scanner.nextFloat();
                        System.out.print("Enter cleaner birthDay: ");
                        int cleanerDay1 = scanner.nextInt();
                        System.out.print("Enter cleaner birthMonth: ");
                        int cleanerMonth1 = scanner.nextInt();
                        System.out.print("Enter cleaner birthYear: ");
                        int cleanerYear1 = scanner.nextInt();
                        System.out.print("Enter cleaner house number: ");
                        int cleanerHouse1 = scanner.nextInt();
                        System.out.print("Enter cleaner road number: ");
                        int cleanerRoad1 = scanner.nextInt();
                        System.out.print("Enter cleaner block number: ");
                        int cleanerBlock1 = scanner.nextInt();
                        System.out.print("Enter cleaner area: ");
                        String nothing19 = scanner.nextLine();
                        String cleanerArea1 = scanner.nextLine();
                        System.out.print("Enter cleaner state: ");
                        String cleanerState1 = scanner.nextLine();
                        System.out.print("Enter cleaner region: ");
                        String cleanerRegion1 = scanner.nextLine();
                        System.out.print("Enter cleaner continent: ");
                        String cleanerContinent1 = scanner.nextLine();
                        System.out.print("Enter cleaner country: ");
                        String cleanerCountry1 = scanner.nextLine();
                        System.out.print("Enter cleaner internet name: ");
                        String cleanerNetName1 = scanner.nextLine();
                        System.out.print("Enter cleaner internet password type: ");
                        String cleanerNetPassType1 = scanner.next();
                        System.out.print("Enter cleaner internet password: ");
                        String cleanerNetPass1 = scanner.nextLine();
                        System.out.print("Enter cleaner internet IP address: ");
                        String cleanerNetIP1 = scanner.next();
                        System.out.print("Enter cleaner internet IP type: ");
                        String cleanerNetIPType1 = scanner.nextLine();
                        System.out.print("Enter internet provider name: ");
                        String providerName4 = scanner.nextLine();
                        System.out.print("Enter internet provider phone number: ");
                        String providerPhone4 = scanner.nextLine();
                        System.out.print("Enter internet provider email: ");
                        String providerEmail4 = scanner.next();
                        System.out.print("Enter internet provider ID: ");
                        long providerID4 = scanner.nextLong();
                        System.out.println("How much money does the provider have?");
                        System.out.print("Answer: ");
                        float providerMoney4 = scanner.nextFloat();
                        System.out.print("Enter internet provider birthDay: ");
                        int providerDay4 = scanner.nextInt();
                        System.out.print("Enter internet provider birthMonth: ");
                        int providerMonth4 = scanner.nextInt();
                        System.out.print("Enter internet provider birthYear: ");
                        int providerYear4 = scanner.nextInt();
                        System.out.print("Enter internet provider house number: ");
                        int providerHouse4 = scanner.nextInt();
                        System.out.print("Enter internet provider road number: ");
                        int providerRoad4 = scanner.nextInt();
                        System.out.print("Enter internet provider block number: ");
                        int providerBlock4 = scanner.nextInt();
                        System.out.print("Enter internet provider area: ");
                        String nothing20 = scanner.nextLine();
                        String providerArea4 = scanner.nextLine();
                        System.out.print("Enter internet provider state: ");
                        String providerState4 = scanner.nextLine();
                        System.out.print("Enter internet provider region: ");
                        String providerRegion4 = scanner.nextLine();
                        System.out.print("Enter internet provider continent: ");
                        String providerContinent4 = scanner.nextLine();
                        System.out.println("Enter internet provider country: ");
                        String providerCountry4 = scanner.nextLine();
                        Person person5 = new Person(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                        Address address3 = new Address(cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                        Date date3 = new Date(cleanerDay1, cleanerMonth1, cleanerYear1);
                        Person person6 = new Person(providerName4, providerPhone4, providerEmail4, providerID4, providerMoney4, providerDay4, providerMonth4, providerYear4, providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                        Address address4 = new Address(providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                        Date date4 = new Date(providerDay4, providerMonth4, providerYear4);
                        peopleRecords.add(person5);
                        peopleRecords.add(person6);
                        addressLinkedHashing.add(address3);
                        addressLinkedHashing.add(address4);
                        dateArrayHashing.add(date3);
                        dateArrayHashing.add(date4);
                        cleaner = new Cleaner(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1 ,cleanerNetName1, cleanerNetPassType1, cleanerNetPass1, cleanerNetIP1, cleanerNetIPType1, person6);
                        cleanerKWLinkedList.addFirst(cleaner);
                        System.out.println("Cleaner have been successfully added to the list. ");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 27 -> {
                    System.out.print("Enter your ID: ");
                    long managerID2 = scanner.nextLong();
                    if (manager.getID() == managerID2){
                        System.out.print("Enter cleaner name: ");
                        String nothing18 = scanner.nextLine();
                        String cleanerName1 = scanner.nextLine();
                        System.out.print("Enter cleaner phone number: ");
                        String cleanerPhone1 = scanner.nextLine();
                        System.out.print("Enter cleaner email: ");
                        String cleanerEmail1 = scanner.next();
                        System.out.print("Enter cleaner ID: ");
                        long cleanerID1 = scanner.nextLong();
                        System.out.println("How much money does the cleaner have?");
                        System.out.print("Answer: ");
                        float cleanerMoney1 = scanner.nextFloat();
                        System.out.print("Enter cleaner birthDay: ");
                        int cleanerDay1 = scanner.nextInt();
                        System.out.print("Enter cleaner birthMonth: ");
                        int cleanerMonth1 = scanner.nextInt();
                        System.out.print("Enter cleaner birthYear: ");
                        int cleanerYear1 = scanner.nextInt();
                        System.out.print("Enter cleaner house number: ");
                        int cleanerHouse1 = scanner.nextInt();
                        System.out.print("Enter cleaner road number: ");
                        int cleanerRoad1 = scanner.nextInt();
                        System.out.print("Enter cleaner block number: ");
                        int cleanerBlock1 = scanner.nextInt();
                        System.out.print("Enter cleaner area: ");
                        String nothing19 = scanner.nextLine();
                        String cleanerArea1 = scanner.nextLine();
                        System.out.print("Enter cleaner state: ");
                        String cleanerState1 = scanner.nextLine();
                        System.out.print("Enter cleaner region: ");
                        String cleanerRegion1 = scanner.nextLine();
                        System.out.print("Enter cleaner continent: ");
                        String cleanerContinent1 = scanner.nextLine();
                        System.out.print("Enter cleaner country: ");
                        String cleanerCountry1 = scanner.nextLine();
                        System.out.print("Enter cleaner internet name: ");
                        String cleanerNetName1 = scanner.nextLine();
                        System.out.print("Enter cleaner internet password type: ");
                        String cleanerNetPassType1 = scanner.next();
                        System.out.print("Enter cleaner internet password: ");
                        String cleanerNetPass1 = scanner.nextLine();
                        System.out.print("Enter cleaner internet IP address: ");
                        String cleanerNetIP1 = scanner.next();
                        System.out.print("Enter cleaner internet IP type: ");
                        String cleanerNetIPType1 = scanner.nextLine();
                        System.out.print("Enter internet provider name: ");
                        String providerName4 = scanner.nextLine();
                        System.out.print("Enter internet provider phone number: ");
                        String providerPhone4 = scanner.nextLine();
                        System.out.print("Enter internet provider email: ");
                        String providerEmail4 = scanner.next();
                        System.out.print("Enter internet provider ID: ");
                        long providerID4 = scanner.nextLong();
                        System.out.println("How much money does the provider have?");
                        System.out.print("Answer: ");
                        float providerMoney4 = scanner.nextFloat();
                        System.out.print("Enter internet provider birthDay: ");
                        int providerDay4 = scanner.nextInt();
                        System.out.print("Enter internet provider birthMonth: ");
                        int providerMonth4 = scanner.nextInt();
                        System.out.print("Enter internet provider birthYear: ");
                        int providerYear4 = scanner.nextInt();
                        System.out.print("Enter internet provider house number: ");
                        int providerHouse4 = scanner.nextInt();
                        System.out.print("Enter internet provider road number: ");
                        int providerRoad4 = scanner.nextInt();
                        System.out.print("Enter internet provider block number: ");
                        int providerBlock4 = scanner.nextInt();
                        System.out.print("Enter internet provider area: ");
                        String nothing20 = scanner.nextLine();
                        String providerArea4 = scanner.nextLine();
                        System.out.print("Enter internet provider state: ");
                        String providerState4 = scanner.nextLine();
                        System.out.print("Enter internet provider region: ");
                        String providerRegion4 = scanner.nextLine();
                        System.out.print("Enter internet provider continent: ");
                        String providerContinent4 = scanner.nextLine();
                        System.out.println("Enter internet provider country: ");
                        String providerCountry4 = scanner.nextLine();
                        Person person5 = new Person(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                        Address address3 = new Address(cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                        Date date3 = new Date(cleanerDay1, cleanerMonth1, cleanerYear1);
                        Person person6 = new Person(providerName4, providerPhone4, providerEmail4, providerID4, providerMoney4, providerDay4, providerMonth4, providerYear4, providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                        Address address4 = new Address(providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                        Date date4 = new Date(providerDay4, providerMonth4, providerYear4);
                        peopleRecords.add(person5);
                        peopleRecords.add(person6);
                        addressLinkedHashing.add(address3);
                        addressLinkedHashing.add(address4);
                        dateArrayHashing.add(date3);
                        dateArrayHashing.add(date4);
                        cleaner = new Cleaner(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1 ,cleanerNetName1, cleanerNetPassType1, cleanerNetPass1, cleanerNetIP1, cleanerNetIPType1, person6);
                        if (cleanerKWLinkedList.remove(cleaner).equals(cleaner))
                            System.out.println("Cleaner have been deleted from the list successfully.");
                        else
                            System.out.println("Failed to successfully delete cleaner from the list.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 28 -> {
                    System.out.print("Enter your ID: ");
                    long managerID2 = scanner.nextLong();
                    if (manager.getID() == managerID2){
                        System.out.print("Enter cleaner name: ");
                        String nothing18 = scanner.nextLine();
                        String cleanerName1 = scanner.nextLine();
                        System.out.print("Enter cleaner phone number: ");
                        String cleanerPhone1 = scanner.nextLine();
                        System.out.print("Enter cleaner email: ");
                        String cleanerEmail1 = scanner.next();
                        System.out.print("Enter cleaner ID: ");
                        long cleanerID1 = scanner.nextLong();
                        System.out.println("How much money does the cleaner have?");
                        System.out.print("Answer: ");
                        float cleanerMoney1 = scanner.nextFloat();
                        System.out.print("Enter cleaner birthDay: ");
                        int cleanerDay1 = scanner.nextInt();
                        System.out.print("Enter cleaner birthMonth: ");
                        int cleanerMonth1 = scanner.nextInt();
                        System.out.print("Enter cleaner birthYear: ");
                        int cleanerYear1 = scanner.nextInt();
                        System.out.print("Enter cleaner house number: ");
                        int cleanerHouse1 = scanner.nextInt();
                        System.out.print("Enter cleaner road number: ");
                        int cleanerRoad1 = scanner.nextInt();
                        System.out.print("Enter cleaner block number: ");
                        int cleanerBlock1 = scanner.nextInt();
                        System.out.print("Enter cleaner area: ");
                        String nothing19 = scanner.nextLine();
                        String cleanerArea1 = scanner.nextLine();
                        System.out.print("Enter cleaner state: ");
                        String cleanerState1 = scanner.nextLine();
                        System.out.print("Enter cleaner region: ");
                        String cleanerRegion1 = scanner.nextLine();
                        System.out.print("Enter cleaner continent: ");
                        String cleanerContinent1 = scanner.nextLine();
                        System.out.print("Enter cleaner country: ");
                        String cleanerCountry1 = scanner.nextLine();
                        System.out.print("Enter cleaner internet name: ");
                        String cleanerNetName1 = scanner.nextLine();
                        System.out.print("Enter cleaner internet password type: ");
                        String cleanerNetPassType1 = scanner.next();
                        System.out.print("Enter cleaner internet password: ");
                        String cleanerNetPass1 = scanner.nextLine();
                        System.out.print("Enter cleaner internet IP address: ");
                        String cleanerNetIP1 = scanner.next();
                        System.out.print("Enter cleaner internet IP type: ");
                        String cleanerNetIPType1 = scanner.nextLine();
                        System.out.print("Enter internet provider name: ");
                        String providerName4 = scanner.nextLine();
                        System.out.print("Enter internet provider phone number: ");
                        String providerPhone4 = scanner.nextLine();
                        System.out.print("Enter internet provider email: ");
                        String providerEmail4 = scanner.next();
                        System.out.print("Enter internet provider ID: ");
                        long providerID4 = scanner.nextLong();
                        System.out.println("How much money does the provider have?");
                        System.out.print("Answer: ");
                        float providerMoney4 = scanner.nextFloat();
                        System.out.print("Enter internet provider birthDay: ");
                        int providerDay4 = scanner.nextInt();
                        System.out.print("Enter internet provider birthMonth: ");
                        int providerMonth4 = scanner.nextInt();
                        System.out.print("Enter internet provider birthYear: ");
                        int providerYear4 = scanner.nextInt();
                        System.out.print("Enter internet provider house number: ");
                        int providerHouse4 = scanner.nextInt();
                        System.out.print("Enter internet provider road number: ");
                        int providerRoad4 = scanner.nextInt();
                        System.out.print("Enter internet provider block number: ");
                        int providerBlock4 = scanner.nextInt();
                        System.out.print("Enter internet provider area: ");
                        String nothing20 = scanner.nextLine();
                        String providerArea4 = scanner.nextLine();
                        System.out.print("Enter internet provider state: ");
                        String providerState4 = scanner.nextLine();
                        System.out.print("Enter internet provider region: ");
                        String providerRegion4 = scanner.nextLine();
                        System.out.print("Enter internet provider continent: ");
                        String providerContinent4 = scanner.nextLine();
                        System.out.println("Enter internet provider country: ");
                        String providerCountry4 = scanner.nextLine();
                        Person person5 = new Person(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                        Address address3 = new Address(cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1);
                        Date date3 = new Date(cleanerDay1, cleanerMonth1, cleanerYear1);
                        Person person6 = new Person(providerName4, providerPhone4, providerEmail4, providerID4, providerMoney4, providerDay4, providerMonth4, providerYear4, providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                        Address address4 = new Address(providerHouse4, providerRoad4, providerBlock4, providerArea4, providerState4, providerRegion4, providerContinent4, providerCountry4);
                        Date date4 = new Date(providerDay4, providerMonth4, providerYear4);
                        peopleRecords.add(person5);
                        peopleRecords.add(person6);
                        addressLinkedHashing.add(address3);
                        addressLinkedHashing.add(address4);
                        dateArrayHashing.add(date3);
                        dateArrayHashing.add(date4);
                        cleaner = new Cleaner(cleanerName1, cleanerPhone1, cleanerEmail1, cleanerID1, cleanerMoney1, cleanerDay1, cleanerMonth1, cleanerYear1, cleanerHouse1, cleanerRoad1, cleanerBlock1, cleanerArea1, cleanerState1, cleanerRegion1, cleanerContinent1, cleanerCountry1 ,cleanerNetName1, cleanerNetPassType1, cleanerNetPass1, cleanerNetIP1, cleanerNetIPType1, person6);
                        int cleanerIndex1 = cleanerKWLinkedList.search(cleaner);
                        if (cleanerIndex1 > -1)
                            System.out.println("The cleaner is found in the list at index "+cleanerIndex1);
                        else
                            System.out.println("The cleaner cannot be found in the list.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 29 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        System.out.print("Enter an index for cleaner list: ");
                        int cleanerIndex = scanner.nextInt();
                        System.out.println("Information found from the list: ");
                        System.out.println(cleanerKWLinkedList.get(cleanerIndex));
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature!");
                    }
                }
                case 31 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        while (!cleanerKWLinkedList.isEmpty())
                            cleanerKWLinkedList.removeLast();
                        System.out.println("All cleaners have been erased.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 32 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        System.out.print("Enter internet name: ");
                        String nothing6 = scanner.nextLine();
                        String internetName2 = scanner.nextLine();
                        System.out.print("Enter internet password type: ");
                        String internetPassType2 = scanner.next();
                        System.out.print("Enter internet password: ");
                        String internetPass2 = scanner.nextLine();
                        System.out.print("Enter internet ip address: ");
                        String internetAddress2 = scanner.next();
                        System.out.print("Enter internet ip type: ");
                        String internetIPType2 = scanner.next();
                        System.out.print("Enter provider's name: ");
                        String providerName1 = scanner.nextLine();
                        System.out.print("Enter provider's phone number: ");
                        String providerPhone1 = scanner.nextLine();
                        System.out.print("Enter provider's email: ");
                        String providerEmail1 = scanner.next();
                        System.out.print("Enter provider's ID: ");
                        long providerID1 = scanner.nextLong();
                        System.out.println("How much money does the provider have? ");
                        System.out.print("Answer: ");
                        float providerMoney1 = scanner.nextFloat();
                        System.out.print("Enter provider's birthDay: ");
                        int providerDay1 = scanner.nextInt();
                        System.out.print("Enter provider's birthMonth: ");
                        int providerMonth1 = scanner.nextInt();
                        System.out.print("Enter provider's birthYear: ");
                        int providerYear1 = scanner.nextInt();
                        System.out.print("Enter provider's house number: ");
                        int providerHouse1 = scanner.nextInt();
                        System.out.print("Enter provider's road number: ");
                        int providerRoad1 = scanner.nextInt();
                        System.out.print("Enter provider's block number: ");
                        int providerBlock1 = scanner.nextInt();
                        System.out.print("Enter provider's area: ");
                        String providerArea1 = scanner.next();
                        System.out.print("Enter provider's state: ");
                        String providerState1 = scanner.nextLine();
                        System.out.print("Enter provider's region: ");
                        String providerRegion1 = scanner.nextLine();
                        System.out.print("Enter provider's continent: ");
                        String providerContinent1 = scanner.nextLine();
                        System.out.print("Enter provider's country: ");
                        String providerCountry1 = scanner.nextLine();
                        Person person1 = new Person(providerName1, providerPhone1, providerEmail1, providerID1, providerMoney1, providerDay1, providerMonth1, providerYear1, providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                        peopleRecords.addLast(person1);
                        address = new Address(providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                        addressLinkedHashing.add(address);
                        date = new Date(providerDay1, providerMonth1, providerYear1);
                        dateArrayHashing.add(date);
                        System.out.println("Provider have been added to a list");
                        internet = new Internet(internetName2, internetPassType2, internetPass2, internetAddress2, internetIPType2, person1);
                        internetKWLinkedList.add(internet);
                        System.out.println("An internet have been added to the list.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 33 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        System.out.print("Enter internet name: ");
                        String nothing6 = scanner.nextLine();
                        String internetName2 = scanner.nextLine();
                        System.out.print("Enter internet password type: ");
                        String internetPassType2 = scanner.next();
                        System.out.print("Enter internet password: ");
                        String internetPass2 = scanner.nextLine();
                        System.out.print("Enter internet ip address: ");
                        String internetAddress2 = scanner.next();
                        System.out.print("Enter internet ip type: ");
                        String internetIPType2 = scanner.next();
                        System.out.print("Enter provider's name: ");
                        String providerName1 = scanner.nextLine();
                        System.out.print("Enter provider's phone number: ");
                        String providerPhone1 = scanner.nextLine();
                        System.out.print("Enter provider's email: ");
                        String providerEmail1 = scanner.next();
                        System.out.print("Enter provider's ID: ");
                        long providerID1 = scanner.nextLong();
                        System.out.println("How much money does the provider have? ");
                        System.out.print("Answer: ");
                        float providerMoney1 = scanner.nextFloat();
                        System.out.print("Enter provider's birthDay: ");
                        int providerDay1 = scanner.nextInt();
                        System.out.print("Enter provider's birthMonth: ");
                        int providerMonth1 = scanner.nextInt();
                        System.out.print("Enter provider's birthYear: ");
                        int providerYear1 = scanner.nextInt();
                        System.out.print("Enter provider's house number: ");
                        int providerHouse1 = scanner.nextInt();
                        System.out.print("Enter provider's road number: ");
                        int providerRoad1 = scanner.nextInt();
                        System.out.print("Enter provider's block number: ");
                        int providerBlock1 = scanner.nextInt();
                        System.out.print("Enter provider's area: ");
                        String providerArea1 = scanner.next();
                        System.out.print("Enter provider's state: ");
                        String providerState1 = scanner.nextLine();
                        System.out.print("Enter provider's region: ");
                        String providerRegion1 = scanner.nextLine();
                        System.out.print("Enter provider's continent: ");
                        String providerContinent1 = scanner.nextLine();
                        System.out.print("Enter provider's country: ");
                        String providerCountry1 = scanner.nextLine();
                        Person person1 = new Person(providerName1, providerPhone1, providerEmail1, providerID1, providerMoney1, providerDay1, providerMonth1, providerYear1, providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                        peopleRecords.addLast(person1);
                        address = new Address(providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                        addressLinkedHashing.add(address);
                        date = new Date(providerDay1, providerMonth1, providerYear1);
                        dateArrayHashing.add(date);
                        System.out.println("Provider have been added to a list");
                        internet = new Internet(internetName2, internetPassType2, internetPass2, internetAddress2, internetIPType2, person1);
                        if (internetKWLinkedList.remove(internet).equals(internet))
                            System.out.println("An internet have been successfully deleted.");
                        else
                            System.out.println("Failed to delete an internet from the list!");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 34 -> {
                    boolean[] founding = {false, false};
                    System.out.print("Enter your ID: ");
                    long customerID = scanner.nextLong();
                    for (int i = 0; i < customerKWLinkedList.size(); i++)
                        if (customerKWLinkedList.get(i).getID() == customerID){
                            founding[0] = true;
                            customer = customerKWLinkedList.get(i);
                            break;
                        }
                    for (int j = 0; j < cleanerKWLinkedList.size(); j++)
                        if (cleanerKWLinkedList.get(j).getID() == customerID){
                            founding[1] = true;
                            cleaner = cleanerKWLinkedList.get(j);
                            break;
                        }
                    if (founding[0] || manager.getID() == customerID || founding[1]){
                        System.out.print("Enter internet name: ");
                        String nothing6 = scanner.nextLine();
                        String internetName2 = scanner.nextLine();
                        System.out.print("Enter internet password type: ");
                        String internetPassType2 = scanner.next();
                        System.out.print("Enter internet password: ");
                        String internetPass2 = scanner.nextLine();
                        System.out.print("Enter internet ip address: ");
                        String internetAddress2 = scanner.next();
                        System.out.print("Enter internet ip type: ");
                        String internetIPType2 = scanner.next();
                        System.out.print("Enter provider's name: ");
                        String providerName1 = scanner.nextLine();
                        System.out.print("Enter provider's phone number: ");
                        String providerPhone1 = scanner.nextLine();
                        System.out.print("Enter provider's email: ");
                        String providerEmail1 = scanner.next();
                        System.out.print("Enter provider's ID: ");
                        long providerID1 = scanner.nextLong();
                        System.out.println("How much money does the provider have? ");
                        System.out.print("Answer: ");
                        float providerMoney1 = scanner.nextFloat();
                        System.out.print("Enter provider's birthDay: ");
                        int providerDay1 = scanner.nextInt();
                        System.out.print("Enter provider's birthMonth: ");
                        int providerMonth1 = scanner.nextInt();
                        System.out.print("Enter provider's birthYear: ");
                        int providerYear1 = scanner.nextInt();
                        System.out.print("Enter provider's house number: ");
                        int providerHouse1 = scanner.nextInt();
                        System.out.print("Enter provider's road number: ");
                        int providerRoad1 = scanner.nextInt();
                        System.out.print("Enter provider's block number: ");
                        int providerBlock1 = scanner.nextInt();
                        System.out.print("Enter provider's area: ");
                        String providerArea1 = scanner.next();
                        System.out.print("Enter provider's state: ");
                        String providerState1 = scanner.nextLine();
                        System.out.print("Enter provider's region: ");
                        String providerRegion1 = scanner.nextLine();
                        System.out.print("Enter provider's continent: ");
                        String providerContinent1 = scanner.nextLine();
                        System.out.print("Enter provider's country: ");
                        String providerCountry1 = scanner.nextLine();
                        Person person1 = new Person(providerName1, providerPhone1, providerEmail1, providerID1, providerMoney1, providerDay1, providerMonth1, providerYear1, providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                        peopleRecords.addLast(person1);
                        address = new Address(providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                        addressLinkedHashing.add(address);
                        date = new Date(providerDay1, providerMonth1, providerYear1);
                        dateArrayHashing.add(date);
                        System.out.println("Provider have been added to a list");
                        internet = new Internet(internetName2, internetPassType2, internetPass2, internetAddress2, internetIPType2, person1);
                        int internetIndex = internetKWLinkedList.search(internet);
                        if (internetIndex > -1)
                            System.out.println("The internet is found in the list at index "+internetIndex);
                        else
                            System.out.println("Cannot find internet from the list.");
                    }
                    else {
                        System.out.println("Access denied!");
                        System.out.println("You need to be a customer, manager, or cleaner to access this feature.");
                    }
                }
                case 35 -> {
                    System.out.println("Enter an index for internet list: ");
                    int internetIndex = scanner.nextInt();
                    System.out.println("Information found from the list: ");
                    System.out.println(internetKWLinkedList.get(internetIndex));
                }
                case 36 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        System.out.print("Enter internet name: ");
                        String nothing6 = scanner.nextLine();
                        String internetName2 = scanner.nextLine();
                        System.out.print("Enter internet password type: ");
                        String internetPassType2 = scanner.next();
                        System.out.print("Enter internet password: ");
                        String internetPass2 = scanner.nextLine();
                        System.out.print("Enter internet ip address: ");
                        String internetAddress2 = scanner.next();
                        System.out.print("Enter internet ip type: ");
                        String internetIPType2 = scanner.next();
                        System.out.print("Enter provider's name: ");
                        String providerName1 = scanner.nextLine();
                        System.out.print("Enter provider's phone number: ");
                        String providerPhone1 = scanner.nextLine();
                        System.out.print("Enter provider's email: ");
                        String providerEmail1 = scanner.next();
                        System.out.print("Enter provider's ID: ");
                        long providerID1 = scanner.nextLong();
                        System.out.println("How much money does the provider have? ");
                        System.out.print("Answer: ");
                        float providerMoney1 = scanner.nextFloat();
                        System.out.print("Enter provider's birthDay: ");
                        int providerDay1 = scanner.nextInt();
                        System.out.print("Enter provider's birthMonth: ");
                        int providerMonth1 = scanner.nextInt();
                        System.out.print("Enter provider's birthYear: ");
                        int providerYear1 = scanner.nextInt();
                        System.out.print("Enter provider's house number: ");
                        int providerHouse1 = scanner.nextInt();
                        System.out.print("Enter provider's road number: ");
                        int providerRoad1 = scanner.nextInt();
                        System.out.print("Enter provider's block number: ");
                        int providerBlock1 = scanner.nextInt();
                        System.out.print("Enter provider's area: ");
                        String providerArea1 = scanner.next();
                        System.out.print("Enter provider's state: ");
                        String providerState1 = scanner.nextLine();
                        System.out.print("Enter provider's region: ");
                        String providerRegion1 = scanner.nextLine();
                        System.out.print("Enter provider's continent: ");
                        String providerContinent1 = scanner.nextLine();
                        System.out.print("Enter provider's country: ");
                        String providerCountry1 = scanner.nextLine();
                        Person person1 = new Person(providerName1, providerPhone1, providerEmail1, providerID1, providerMoney1, providerDay1, providerMonth1, providerYear1, providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                        peopleRecords.addLast(person1);
                        Address address1 = new Address(providerHouse1, providerRoad1, providerBlock1, providerArea1, providerState1, providerRegion1, providerContinent1, providerCountry1);
                        addressLinkedHashing.add(address1);
                        Date date1 = new Date(providerDay1, providerMonth1, providerYear1);
                        dateArrayHashing.add(date1);
                        System.out.println("Provider have been added to a list");
                        Internet internet1 = new Internet(internetName2, internetPassType2, internetPass2, internetAddress2, internetIPType2, person1);
                        System.out.print("Enter new internet name: ");
                        String newInternetName2 = scanner.nextLine();
                        System.out.print("Enter new internet password type: ");
                        String newPasswordType2 = scanner.next();
                        System.out.print("Enter new internet password: ");
                        String newPassword2 = scanner.nextLine();
                        System.out.print("Enter new IP address: ");
                        String newIPAddress2 = scanner.next();
                        System.out.print("Enter new IP type: ");
                        String newIPType2 = scanner.next();
                        System.out.print("Enter new provider's name: ");
                        String providerName2 = scanner.nextLine();
                        System.out.print("Enter new provider's phone number: ");
                        String providerPhone2 = scanner.nextLine();
                        System.out.print("Enter new provider's email: ");
                        String providerEmail2 = scanner.next();
                        System.out.print("Enter new provider's ID: ");
                        long providerID2 = scanner.nextLong();
                        System.out.println("How much money does the provider have? ");
                        System.out.print("Answer: ");
                        float providerMoney2 = scanner.nextFloat();
                        System.out.print("Enter new provider's birthDay: ");
                        int providerDay2 = scanner.nextInt();
                        System.out.print("Enter new provider's birthMonth: ");
                        int providerMonth2 = scanner.nextInt();
                        System.out.print("Enter new provider's birthYear: ");
                        int providerYear2 = scanner.nextInt();
                        System.out.print("Enter new provider's house number: ");
                        int providerHouse2 = scanner.nextInt();
                        System.out.print("Enter new provider's road number: ");
                        int providerRoad2 = scanner.nextInt();
                        System.out.print("Enter new provider's block number: ");
                        int providerBlock2 = scanner.nextInt();
                        System.out.print("Enter new provider's area: ");
                        String providerArea2 = scanner.next();
                        System.out.print("Enter new provider's state: ");
                        String providerState2 = scanner.nextLine();
                        System.out.print("Enter new provider's region: ");
                        String providerRegion2 = scanner.nextLine();
                        System.out.print("Enter new provider's continent: ");
                        String providerContinent2 = scanner.nextLine();
                        System.out.print("Enter new provider's country: ");
                        String providerCountry2 = scanner.nextLine();
                        Person person2 = new Person(providerName2, providerPhone2, providerEmail2, providerID2, providerMoney2, providerDay2, providerMonth2, providerYear2, providerHouse2, providerRoad2, providerBlock2, providerArea2, providerState2, providerRegion2, providerContinent2, providerCountry2);
                        Address address2 = new Address(providerHouse2, providerRoad2, providerBlock2, providerArea2, providerState2, providerRegion2, providerContinent2, providerCountry2);
                        Date date2 = new Date(providerDay2, providerMonth2, providerYear2);
                        peopleRecords.add(person2);
                        addressLinkedHashing.add(address2);
                        dateArrayHashing.add(date2);
                        Internet internet2 = new Internet(newInternetName2, newPasswordType2, newPassword2, newIPAddress2, newIPType2, person2);
                        internetKWLinkedList.replace(internet1, internet2);
                        System.out.println("The old internet have been replaced by the new internet.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 37 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        while (!internetKWLinkedList.isEmpty())
                            internetKWLinkedList.removeLast();
                        System.out.println("All internets have been erased.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a manager to access this feature.");
                    }
                }
                case 38 -> {
                    boolean[] checkers = {false, false};
                    System.out.print("Enter your ID: ");
                    long anyID = scanner.nextLong();
                    for (int e = 0; e < waiterSingleLinkedList.size(); e++)
                        if (waiterSingleLinkedList.get(e).getID() == anyID){
                            checkers[0] = true;
                            waiter = waiterSingleLinkedList.get(e);
                            break;
                        }
                    for (int f = 0; f < customerKWLinkedList.size(); f++)
                        if (customerKWLinkedList.get(f).getID() == anyID){
                            checkers[1] = true;
                            customer = customerKWLinkedList.get(f);
                            break;
                        }
                    if (manager.getID() == anyID){
                        boolean[] founds = {false, false};
                        System.out.print("Enter the room number: ");
                        int roomNum = scanner.nextInt();
                        System.out.print("Enter the floor number: ");
                        int floorNum = scanner.nextInt();
                        for (int k = 0; k < roomSingleLinkedList.size(); k++)
                            if (roomSingleLinkedList.get(k).getRoomNumber() == roomNum && roomSingleLinkedList.get(k).getFloorNumber() == floorNum){
                                room = roomSingleLinkedList.get(k);
                                founds[0] = true;
                                break;
                            }
                        if (request){
                            if (founds[0] || founds[1]){
                                roomsForCleaning.add(manager.assignRoom(customer, room));
                                requests.removeLast();
                                System.out.println("A room has been assigned for cleaning upon the customer's request.");
                            }
                            else
                                System.out.println("Room not found for cleaning, so the request has been cancelled.");
                        }
                        else {
                            System.out.print("Enter the customer's ID: ");
                            int idCustomer = scanner.nextInt();
                            for (int n = 0; n < customerKWLinkedList.size(); n++)
                                if (customerKWLinkedList.get(n).getID() == idCustomer){
                                    founds[1] = true;
                                    customer = customerKWLinkedList.get(n);
                                    break;
                                }
                            if (founds[0] && founds[1]){
                                manager.assignRoom(customer, room);
                                System.out.println("A room has been assigned for cleaning due to room maintenance only.");
                            }
                            else {
                                System.out.println("Both the room and the customer has not been found.");
                                System.out.println("Therefore, the room has not been assigned for cleaning.");
                            }
                        }
                    }
                    else if (checkers[0]){
                        System.out.println("Choose from the list below or enter a location for the trip: ");
                        for (String suggestion : suggestions)
                            System.out.println(suggestion);
                        System.out.print("Answer: ");
                        String nothing17 = scanner.nextLine();
                        String takeTrip = scanner.nextLine();
                        System.out.print("Enter the name of the customer that is willing to go on a trip: ");
                        String customerName = scanner.nextLine();
                        for (int h = 0; h < customerKWLinkedList.size(); h++)
                            if (customerKWLinkedList.get(h).getName().compareTo(customerName) == 0){
                                customer = customerKWLinkedList.get(h);
                                trips.add(waiter.offerTrip(customer, takeTrip, manager));
                                System.out.println("A trip to "+trips.get(trips.indexOf(takeTrip))+" have been already offered to the customer.");
                                break;
                            }
                        System.out.println("If you did not see the trip offer to customer, then this means that the operation failed.");
                    }
                    else if (checkers[1]){
                        System.out.println("Choose from option below to get started: ");
                        System.out.println("(0) Cancel");
                        System.out.println("(1) Suggest Trip");
                        System.out.println("(2) Request a room for cleaning");
                        System.out.print("Answer: ");
                        int customerChoice = scanner.nextInt();
                        if (customerChoice == 1){
                            System.out.print("Enter location as a suggestion for going to the trip: ");
                            String nothing16 = scanner.nextLine();
                            String tripSuggest = scanner.nextLine();
                            suggestions.add(customer.suggestTrip(tripSuggest));
                        }
                        else if (customerChoice == 2){
                            boolean found = false;
                            System.out.print("Enter the room number: ");
                            int roomNum = scanner.nextInt();
                            System.out.print("Enter the floor number: ");
                            int floorNum = scanner.nextInt();
                            for (int m = 0; m < roomSingleLinkedList.size(); m++)
                                if (roomSingleLinkedList.get(m).getRoomNumber() == roomNum && roomSingleLinkedList.get(m).getFloorNumber() == floorNum){
                                    found = true;
                                    room = roomSingleLinkedList.get(m);
                                    break;
                                }
                            if (found){
                                requests.add(customer.requestClean(room));
                                request = true;
                                System.out.println("A room have been requested for cleaning.");
                            }
                            else
                                System.out.println("Room not found for cleaning, so the request has been cancelled.");
                        }
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a waiter, customer, or manager to access this feature.");
                    }
                }
                case 39 -> {
                    boolean founder = false;
                    System.out.print("Enter your ID:");
                    long cleanerID = scanner.nextLong();
                    for (int o = 0; o < cleanerKWLinkedList.size(); o++)
                        if (cleanerKWLinkedList.get(o).getID() == cleanerID){
                            founder = true;
                            cleaner = cleanerKWLinkedList.get(o);
                            break;
                        }
                    if (manager.getID() == cleanerID){
                        int seed;
                        do {
                            seed = random.nextInt(0, cleanerKWLinkedList.size()-1);
                        }
                        while (cleanerKWLinkedList.get(seed) == null);
                        cleaner = cleanerKWLinkedList.get(seed);
                        cleanedRooms.add(cleaner.cleanRoom(room));
                        roomsForCleaning.removeLast();
                        System.out.println("A room for cleaning have been processed.");
                        System.out.println("Cleaned rooms: ");
                        cleanedRooms.display();
                    }
                    else if (founder){
                        cleanedRooms.add(cleaner.cleanRoom(room));
                        roomsForCleaning.removeLast();
                        System.out.println("A room for cleaning have been processed.");
                        System.out.println("Cleaned rooms: ");
                        cleanedRooms.display();
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a cleaner or a manager to access this feature.");
                    }
                }
                case 40 -> {
                    System.out.print("Enter your ID:");
                    long customerID = scanner.nextLong();
                    boolean flag = false;
                    for (int i = 0; i < customerKWLinkedList.size(); i++)
                        if (customerKWLinkedList.get(i).getID() == customerID){
                            flag = true;
                            customer = customerKWLinkedList.get(i);
                            break;
                        }
                    if (flag){
                        String codeAnswer;
                        do {
                            System.out.println("Choose table code from the list below: ");
                            System.out.print("[");
                            for (int j = 0; j < restaurant.getTableCode().size(); j++)
                                System.out.print(restaurant.getTableCodeItem(j)+", ");
                            System.out.print("]");
                            codeAnswer = scanner.next();
                        }
                        while (reservations.peek().compareTo(codeAnswer) == 0);
                        reservations.push(codeAnswer);
                        reservedCustomer.push(customer);
                        System.out.println("How many foods do you want to order?");
                        System.out.print("Answer: ");
                        int foodAnswer = scanner.nextInt();
                        System.out.println("How many drinks do you want to order?");
                        int drinkAnswer = scanner.nextInt();
                        String nothing15 = scanner.nextLine();
                        currentFood = new String[foodAnswer];
                        currentDrink = new String[drinkAnswer];
                        for (int a = 0; a < foodAnswer; a++){
                            System.out.print("Enter a food name: ");
                            currentFood[a] = scanner.nextLine();
                        }
                        for (int b = 0; b < drinkAnswer; b++){
                            System.out.print("Enter a drink name: ");
                            currentDrink[b] = scanner.nextLine();
                        }
                        foodOrders.add(currentFood);
                        drinkOrders.add(currentDrink);
                        proceed = !foodOrders.isEmpty() && !drinkOrders.isEmpty();
                        System.out.println("Thank you for order!");
                        System.out.println("It will be processed by one of the waiters.");
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You're NOT a customer.");
                        System.out.println("You need to be a customer to access this feature.");
                        System.out.println("Contact manager to add you as a customer to access this feature.");
                    }
                }
            }
            System.out.println("Welcome to AQWE Hotel!\n");
            System.out.println("Select from menu below: ");
            System.out.println("(0) Exit");
            System.out.println("(1) Create Restaurant");
            System.out.println("(2) Edit Restaurant");
            System.out.println("(3) Show Restaurant");
            System.out.println("(4) Add Customer");
            System.out.println("(5) Delete Customer");
            System.out.println("(6) Search for a customer");
            System.out.println("(7) Retrieve information about a customer");
            System.out.println("(8) Replace Customer");
            System.out.println("(9) Erase Customers");
            System.out.println("(10) Assign Manager");
            System.out.println("(11) Edit Manager");
            System.out.println("(12) Show Manager");
            System.out.println("(13) Add Room");
            System.out.println("(14) Delete Room");
            System.out.println("(15) Search for a Room");
            System.out.println("(16) Retrieve information about a room");
            System.out.println("(17) Replace Room");
            System.out.println("(18) Book a Room");
            System.out.println("(19) Erase Rooms");
            System.out.println("(20) Add Waiter");
            System.out.println("(21) Delete Waiter");
            System.out.println("(22) Search for a waiter");
            System.out.println("(23) Retrieve information about a waiter");
            System.out.println("(24) Replace Waiter");
            System.out.println("(25) Erase Waiters");
            System.out.println("(26) Add Cleaner");
            System.out.println("(27) Delete Cleaner");
            System.out.println("(28) Search for a cleaner");
            System.out.println("(29) Retrieve information about a cleaner");
            System.out.println("(30) Replace Cleaner");
            System.out.println("(31) Erase Cleaners");
            System.out.println("(32) Add Internet");
            System.out.println("(33) Delete Internet");
            System.out.println("(34) Search for an internet");
            System.out.println("(35) Retrieve information about an internet");
            System.out.println("(36) Replace Internet");
            System.out.println("(37) Erase Internets");
            System.out.println("(38) Add service");
            System.out.println("(39) Process service");
            System.out.println("(40) Add reservation");
            System.out.print("Answer: ");
            selector = scanner.nextInt();
        }
        if (selector <= 0){
            System.out.println("Thank you for using this system!");
            System.out.println("Have a nice day!");
            System.out.println("Good-bye!");
        }
    }
}
