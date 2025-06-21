/*
You need to import all the classes you found in my GitHub repository as this class depends on all of them
Including the Data Structure classes and interfaces I included in my GitHub repository as this class is the biggest class in this project
You don't need to do these when the files are located in the same src folder without syntax errors
Before you use this class, include the keyword "public" in those methods that is missing this in case you encountered any logical errors
I excluded this keyword in some methods of this class to reduce warnings in this file
*/

public class Restaurant {
    String name;
    int countOrders = 0, countCustomers = 0;
    Internet networkInformation;
    KWArrayList<String> tableCode, foods, drinks;
    KWArrayList<Cleaner> cleanerKWArrayList;
    LinkedQueue<Customer> customerLinkedQueue = new LinkedQueue<>();
    KWArrayList<Waiter> waiterKWArrayList;
    ArrayQueue<Integer> orderNumber = new ArrayQueue<>();
    ArrayQueue<String> orders = new ArrayQueue<>();

    public Restaurant(){
        name = "";
        networkInformation = new Internet();
        tableCode = new KWArrayList<>();
        foods = new KWArrayList<>();
        drinks = new KWArrayList<>();
        cleanerKWArrayList = new KWArrayList<>();
        waiterKWArrayList = new KWArrayList<>();
    }

    public Restaurant(String restaurantName, String name, String passwordType, String password, String ipAddress, String ipType, Person provider, int tableSize, int foodSize, int drinkSize, int cleanerSize, int waiterSize){
        this.name = restaurantName;
        networkInformation = new Internet(name, passwordType, password, ipAddress, ipType, provider);
        tableCode = new KWArrayList<>(tableSize);
        foods = new KWArrayList<>(foodSize);
        drinks = new KWArrayList<>(drinkSize);
        waiterKWArrayList = new KWArrayList<>(waiterSize);
        cleanerKWArrayList = new KWArrayList<>(cleanerSize);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCountOrders() {
        return countOrders;
    }

    public int getCountCustomers() {
        return countCustomers;
    }

    public Internet getNetworkInformation() {
        return networkInformation;
    }

    public void setNetworkInformation(String name, String passwordType, String password, String ipAddress, String ipType, Person provider, Person owner) {
        this.networkInformation = new Internet(name, passwordType, password, ipAddress, ipType, provider, owner);
    }

    KWArrayList<String> getTableCode() {
        return tableCode;
    }

    KWArrayList<String> getFoods() {
        return foods;
    }

    KWArrayList<String> getDrinks() {
        return drinks;
    }

    KWArrayList<Cleaner> getCleanerKWArrayList() {
        return cleanerKWArrayList;
    }

    LinkedQueue<Customer> getCustomerLinkedQueue() {
        return customerLinkedQueue;
    }

    KWArrayList<Waiter> getWaiterKWArrayList() {
        return waiterKWArrayList;
    }

    ArrayQueue<Integer> getOrderNumber() {
        return orderNumber;
    }

    ArrayQueue<String> getOrders() {
        return orders;
    }

    public void addTableCode(String item){
        getTableCode().addFirst(item);
        sortTableCodes();
    }

    public String deleteTableCode(String item){
        sortTableCodes();
        return getTableCode().remove(item);
    }

    public int searchTableCode(String item){
        sortTableCodes();
        return getTableCode().search(item);
    }

    public String getTableCodeItem(int index){
        sortTableCodes();
        return getTableCode().get(index);
    }

    private void sortTableCodes(){
        getTableCode().sort();
    }

    public void replaceTableCode(String oldCode, String newCode){
        getTableCode().replace(oldCode, newCode);
    }

    public void eraseTableCodes(){
        while (!getTableCode().isEmpty())
            getTableCode().removeLast();
    }

    public void addCleaner(Cleaner item){
        getCleanerKWArrayList().addLast(item);
    }

    public Cleaner deleteCleaner(Cleaner item){
        return getCleanerKWArrayList().remove(item);
    }

    public int searchCleaner(Cleaner item){
        return getCleanerKWArrayList().search(item);
    }

    public Cleaner getCleaner(int index){
        return getCleanerKWArrayList().get(index);
    }

    public void replaceCleaner(Cleaner oldCleaner, Cleaner newCleaner){
        getCleanerKWArrayList().replace(oldCleaner, newCleaner);
    }

    public void eraseCleaners(){
        while (!getCleanerKWArrayList().isEmpty())
            getCleanerKWArrayList().removeFirst();
    }

    public void displayFoods(){
        System.out.println("Foods: ");
        getFoods().display();
    }

    public void displayDrinks(){
        System.out.println("Drinks: ");
        getDrinks().display();
    }

    public void addOrder(Customer customer, String[] food, String[] drink){
        getOrders().add(customer.orderFood(food), getCountOrders());
        getOrderNumber().add(getCountOrders());
        countOrders += 1;
        getOrders().add(customer.orderDrink(drink), getCountOrders());
        getOrderNumber().add(getCountOrders());
        countOrders += 1;
        getCustomerLinkedQueue().add(customer, getCountCustomers());
        countCustomers += 1;
        System.out.println("Two orders from the customer "+customer.getName()+" have been added to the queue.");
    }

    public String proceedOrder(){
        StringBuilder stringBuilder = new StringBuilder("Orders: {");
        stringBuilder.append(getOrderNumber().removeFirst()).append(". ").append(getOrders().removeFirst()).append(", ").append(getOrderNumber().peek()).append(". ").append(getOrders().peek()).append("}\n");
        getOrders().removeFirst();
        getOrderNumber().removeFirst();
        stringBuilder.append(getCustomerLinkedQueue().toString());
        System.out.println("Two orders from the customer "+getCustomerLinkedQueue().removeFirst().getName()+" have been processed from the queue.");
        return stringBuilder.toString();
    }

    public void addFood(String item){
        getFoods().addFirst(item);
    }

    public String deleteFood(String item){
        return getFoods().remove(item);
    }

    public int searchFood(String item){
        return getFoods().search(item);
    }

    public String getFood(int index){
        return getFoods().get(index);
    }

    public void replaceFood(String oldFood, String newFood){
        getFoods().replace(oldFood, newFood);
    }

    public void eraseFood(){
        while (!getFoods().isEmpty())
            getFoods().removeLast();
    }

    public void addDrink(String item){
        getDrinks().addFirst(item);
    }

    public String deleteDrink(String item){
        return getDrinks().remove(item);
    }

    public int searchDrink(String item){
        return getDrinks().search(item);
    }

    public String getDrink(int index){
        return getDrinks().get(index);
    }

    public void replaceDrink(String oldDrink, String newDrink){
        getDrinks().replace(oldDrink, newDrink);
    }

    public void eraseDrinks(){
        while (!getDrinks().isEmpty())
            getDrinks().removeFirst();
    }

    public void addWaiter(Waiter item){
        getWaiterKWArrayList().add(item);
    }

    public Waiter deleteWaiter(Waiter item){
        return getWaiterKWArrayList().remove(item);
    }

    public int searchWaiter(Waiter item){
        return getWaiterKWArrayList().search(item);
    }

    public Waiter getWaiter(int index){
        return getWaiterKWArrayList().get(index);
    }

    public void replaceWaiter(Waiter oldWaiter, Waiter newWaiter){
        getWaiterKWArrayList().replace(oldWaiter, newWaiter);
    }

    public void eraseWaiter(){
        while (!getWaiterKWArrayList().isEmpty())
            getWaiterKWArrayList().removeLast();
    }

    @Override
    public String toString() {
        return "Restaurant{" +
                "name='" + name + '\'' +
                ", countOrders=" + countOrders +
                ", countCustomers=" + countCustomers +
                ", networkInformation=" + networkInformation +
                ", tableCode=" + tableCode +
                ", foods=" + foods +
                ", drinks=" + drinks +
                ", cleanerKWArrayList=" + cleanerKWArrayList +
                ", customerLinkedQueue=" + customerLinkedQueue +
                ", waiterKWArrayList=" + waiterKWArrayList +
                ", orderNumber=" + orderNumber +
                ", orders=" + orders +
                '}';
    }

    public void display(){
        System.out.println("Restaurant: ");
        System.out.println("Name: "+getName());
        getNetworkInformation().display();
        System.out.println("Current customers count: "+getCountCustomers());
        System.out.println("Current orders count: "+getCountOrders());
        System.out.println("Table codes: ");
        getTableCode().display();
        System.out.println("Cleaners: ");
        getCleanerKWArrayList().display();
        System.out.println("Waiters: ");
        getWaiterKWArrayList().display();
        displayFoods();
        displayDrinks();
        System.out.println("Customers that placed orders: ");
        getCustomerLinkedQueue().display();
        System.out.println("Their orders: ");
        getOrders().display();
    }
}