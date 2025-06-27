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

        KWLinkedList<Customer> customerKWLinkedList = new KWLinkedList<>();
        SingleLinkedList<Waiter> waiterSingleLinkedList = new SingleLinkedList<>();
        KWLinkedList<Cleaner> cleanerKWLinkedList = new KWLinkedList<>();
        SingleLinkedList<Room> roomSingleLinkedList = new SingleLinkedList<>();
        KWLinkedList<Internet> internetKWLinkedList = new KWLinkedList<>();
        KWArrayList<Person> peopleRecords = new KWArrayList<>();
        LinkedHashing<Address> addressLinkedHashing = new LinkedHashing<>();
        ArrayHashing<Date> dateArrayHashing = new ArrayHashing<>();

        int selector;
        String[] currentFood, currentDrink;
        boolean proceed = false;

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
                case 16 -> {
                    System.out.print("Enter the index of room list: ");
                    int roomIndex = scanner.nextInt();
                    System.out.println("Information found from the list: ");
                    System.out.println(roomSingleLinkedList.get(roomIndex));
                }
                case 19 -> {
                    System.out.print("Enter your ID: ");
                    long managerID = scanner.nextLong();
                    if (manager.getID() == managerID){
                        while (!roomSingleLinkedList.isEmpty())
                            roomSingleLinkedList.removeLast();
                        System.out.println("All rooms have been erased.");
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
                        System.out.println("Manager options coming soon.");
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
                        System.out.print("Enter loctaion as a suggestion for going to the trip: ");
                        String nothing16 = scanner.nextLine();
                        String tripSuggest = scanner.nextLine();
                        suggestions.add(customer.suggestTrip(tripSuggest));
                    }
                    else {
                        System.out.println("Access Denied!");
                        System.out.println("You need to be a waiter, customer, or manager to access this feature.");
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
