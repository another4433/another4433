using System.Numerics;
using System.Runtime.CompilerServices;
using static System.Reflection.Metadata.BlobBuilder;

namespace LMS
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            KWArrayList<String> list = new KWArrayList<String>();
            list.add("a");
            Console.WriteLine(Console.ReadLine());
            list.add("b");
            Console.WriteLine(Console.ReadLine());
            list.add("c");
            Console.WriteLine(Console.ReadLine());
            list.add("d");
            Console.WriteLine(Console.ReadLine());
            list.add("e");
            Console.WriteLine(Console.ReadLine());
            list.add("FFFF");
            Console.WriteLine(Console.ReadLine());
            Console.WriteLine("Size: " + list.Size());
            list.remove(2);
            Console.WriteLine("Size: " + list.Size());
            Console.WriteLine(Console.ReadLine());
            list.delete("FFFF");
            Console.WriteLine("Size: " + list.Size());
            Console.WriteLine(Console.ReadLine());
        }
    }
    internal class KWArrayList<E>
    {
        E[] array;
        int size, capacity;
        public KWArrayList()
        {
            capacity = 10;
            size = 0;
            array = new E[capacity];
        }
        public KWArrayList(int initial)
        {
            capacity = (initial <= 0) ? 10 : initial;
            size = 0;
            array = new E[capacity];
        }
        public int Size()
        {
            return size;
        }
        public int Capacity()
        {
            return capacity;
        }
        public E[] getArray()
        {
            return array;
        }
        public E? get(int index)
        {
            if (isRange(index))
            {
                return array[index];
            }
            else
            {
                Console.WriteLine("Item not found!");
                return default(E);
            }
        }
        public bool isEmpty()
        {
            return size == 0;
        }
        public bool isFull()
        {
            return size == capacity;
        }
        public bool isRange(int index)
        {
            return index >= 0 && index < Size();
        }
        private void reallocate()
        {
            E[] backup = new E[Capacity() * 2];
            for (int i = 0; i < Size(); i++)
            {
                backup[i] = array[i];
            }
            array = backup;
        }
        public void put(int index, E value)
        {
            if (isRange(index))
            {
                if (isFull())
                {
                    reallocate();
                }
                for (int i = index + 1; i < Size(); i++)
                {
                    array[i - 1] = array[i];
                }
                array[index] = value;
                size++;
            }
            else if (index == Size() - 1)
            {
                array[Size() - 1] = value;
                size++;
            }
            else if (index == 0)
            {
                array[0] = value;
                size++;
            }
            else
            {
                Console.WriteLine("Array Index out of bound!");
            }
        }
        public E? remove(int index)
        {
            if (isRange(index))
            {
                E backup = array[index];
                for (int i = index+1; i < Size(); i++)
                {
                    array[i-1] = array[i];
                }
                size--;
                return backup;
            }
            else if (index == Size() - 1 || (index == 0 && Size() == 1))
            {
                E backup = array[(size-1) - 1];
                size--;
                return backup;
            }
            else
            {
                Console.WriteLine("Array Index out of bound!");
                return default(E);
            }
        }
        public E? delete(E item)
        {
            return remove(search(item));
        }
        public void addLast(E item)
        {
            if (isFull())
            {
                reallocate();
            }
            array[size] = item;
            size++;
        }
        public int indexOf(E item)
        {
            try
            {
                for (int i = 0; i < Size(); i++)
                {
                    if (((IComparable)array[i]).CompareTo(item) == 0) { return i; }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine($"There's an error in this program and is {e.ToString()}");
            }
            return -1;
        }
        public void addFirst(E item)
        {
            for (int i = 1; i < Size(); i++)
            {
                array[i] = array[i - 1];
            }
            array[0] = item;
            size++;
        }
        public E? removeFirst()
        {
            if (isEmpty())
            {
                Console.WriteLine("Array is empty!");
                return default(E);
            }
            E item = array[0];
            if (Size() > 1)
            {
                for (int i = 1; i < Size(); i++)
                {
                    array[i - 1] = array[i];
                }
            }
            size--;
            return item;
        }
        public void add(E item)
        {
            addLast(item);
        }
        public E? removeLast()
        {
            if (isEmpty())
            {
                Console.WriteLine("Array is empty.");
                return default(E);
            }
            E item = array[size - 1];
            size--;
            return item;
        }
        public int search(E item)
        {
            return indexOf(item);
        }
        public E? set(int index, E item)
        {
            if (isRange(index))
            {
                E old = array[index];
                array[index] = item;
                return old;
            }
            else
            {
                Console.WriteLine("Index fell out of range of array.");
                return default(E);
            }
        }
        public E? replace(E oldItem, E newItem)
        {
            return set(indexOf(oldItem), newItem);
        }
        public void sort()
        {
            try
            {
                for (int i = 0; i < Size() - 1; i++)
                {
                    for (int j = i + 1; j < Size(); j++)
                    {
                        if (((IComparable<E>)array[i]).CompareTo(array[j]) == 0)
                        {
                            E temp = array[j];
                            int backup = Size();
                            for (int k = j + 1; k < backup; k++)
                            {
                                array[k - 1] = array[k];
                            }
                            backup--;
                            for (int a = backup; a > i; a--)
                            {
                                array[a] = array[a - 1];
                            }
                            array[i] = temp;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine($"There's an error in this program and is {e.ToString()}");
            }
        }
        public void shuffle()
        {
            int shuffler = 1;
            for (int i = 0; i < Size(); i++)
            {
                E item = array[i];
                shuffler = shuffler % 3;
                array[i] = array[shuffler];
                array[shuffler] = item;
                shuffler += i;
            }
        }
        public void print()
        {
            Console.WriteLine("Items in the list:");
            string connect = array[0] + ", ";
            for (int i = 1; i < Size(); i++)
            {
                if (i == Size() - 1)
                {
                    connect = connect + array[i];
                }
                else
                {
                    connect = connect + array[i] + ", ";
                }
            }
            Console.WriteLine(connect);
        }
    }
    public interface IPerson
    {
        void setName(string name);
        void setAge(int day, int month, int year);
        void setID(long id);
        string getName();
        long getID();
        int getAge();
        void display();
    }
    public interface IBook
    {
        void setName(string name);
        void setISBN(string id);
        void setBookType(string bookType);
        void setBookLocation(string bookLocation);
        void setAccessNum(long access);
        void setPublisher(String publisher);
        void setYearPublication(int year);
        string getName();
        string getISBN();
        string getBookType();
        string getBookLocation();
        long getAccessNum();
        string getPublisher();
        int getYearPublication();
        void display();
    }
    public interface IDateInt
    {
        void setDate(int day, int month, int year);
        string getDate();
        int getDay();
        int getMonth();
        int getYear();
        void display();
    }
    public class Date : IDateInt
    {
        int day, month, year;
        string date;
        public Date()
        {
            this.day = 0;
            this.month = 0;
            this.year = 0;
            date = day + "/" + month + "/" + year;
        }
        public Date(int day, int month, int year)
        {
            this.day = day;
            this.month = month;
            this.year = year;
            this.date = this.day + "/" + this.month + "/" + this.year;
        }
        public void setDate(int day, int month, int year)
        {
            date = day + "/" + month + "/" + year;
        }
        public int getDay()
        {
            return this.day;
        }
        public int getMonth()
        {
            return this.month;
        }
        public int getYear()
        {
            return this.year;
        }
        public string getDate()
        {
            return this.date;
        }
        public void display()
        {
            Console.WriteLine("Date format: dd/mm/yyyy");
            Console.WriteLine("The date have been adjusted to " + getDate());
        }
    }
    public class Person : IPerson
    {
        string name;
        long id;
        int age;
        public Person()
        {
            name = "Nobody";
            id = 0;
            age = 0;
        }
        public Person(string name, long id, int day, int month, int year)
        {
            this.name = name;
            this.id = id;
            this.age = calculateAge(day, month, year);
        }
        public int calculateAge(int day, int month, int year)
        {
            Date birthDate = new Date(day, month, year);
            Console.WriteLine("Enter today's day number: ");
            int currentDay = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter today's month number: ");
            int currentMonth = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter today's year number: ");
            int currentYear = Convert.ToInt32(Console.ReadLine());
            Date currentDate = new Date(currentDay, currentMonth, currentYear);
            return currentDate.getYear() - birthDate.getYear();
        }
        public string getName()
        {
            return name;
        }
        public long getID()
        {
            return id;
        }
        public int getAge()
        {
            return age;
        }
        public void setName(string name)
        {
            this.name = name;
        }
        public void setID(long id)
        {
            this.id = id;
        }
        public void setAge(int day, int month, int year)
        {
            this.age = calculateAge(day, month, year);
        }
        public void setAge(int age)
        {
            this.age = age;
        }
        public void display()
        {
            Console.WriteLine($"Name: {getName()} \nID: {getID()} \nAge: {getAge()}");
        }
    }
    public class Book : IBook
    {
        string name;
        string ISBN;
        KWArrayList<Person> authors;
        Date issuedDate;
        Date returnDate;
        string bookType;
        string bookLocation;
        long accessNum;
        string publisher;
        int yearPublication;
        float fees;
        public Book()
        {
            authors = new KWArrayList<Person>();
            name = string.Empty;
            ISBN = string.Empty;
            issuedDate = new Date();
            returnDate = new Date();
            bookType = string.Empty;
            bookLocation = string.Empty;
            accessNum = 0;
            publisher = string.Empty;
            yearPublication = 0;
            fees = 0;
        }
        public Book(string name, string iSBN, Date issuedDate, Date returnDate, string bookType, string bookLocation, long accessNum, string publisher, int yearPublication, int size, float fees)
        {
            this.name = name;
            ISBN = iSBN;
            this.issuedDate = issuedDate;
            this.returnDate = returnDate;
            this.bookType = bookType;
            this.bookLocation = bookLocation;
            this.accessNum = accessNum;
            this.publisher = publisher;
            this.yearPublication = yearPublication;
            authors = new KWArrayList<Person>(size);
            this.fees = fees;
        }
        public void setName(string name)
        {
            this.name = name;
        }
        public string getName()
        {
            return this.name;
        }
        public long getAccessNum()
        {
            return this.accessNum;
        }
        public void setISBN(string s)
        {
            this.ISBN = s;
        }
        public void setBookType(string bookType)
        {
            this.bookType = bookType;
        }
        public void setBookLocation(string bookLocation)
        {
            this.bookLocation = bookLocation;
        }
        public void setAccessNum(long accessNum)
        {
            this.accessNum = accessNum;
        }
        public void setPublisher(string publisher)
        {
            this.publisher = publisher;
        }
        public void setFees(float fees)
        {
            this.fees = fees;
        }
        public float getFees()
        {
            return fees;
        }
        public string getPublisher()
        {
            return this.publisher;
        }
        public void setYearPublication(int yearPublication)
        {
            this.yearPublication = yearPublication;
        }
        public string getISBN()
        {
            return this.ISBN;
        }
        public float calculateDelayFees(Date date)
        {
            int count = 0;
            int day = date.getDay();
            int month = date.getMonth();
            int year = date.getYear();
            if ((month <= returnDate.getMonth() && year <= returnDate.getYear()) || (month > returnDate.getMonth() && year <= returnDate.getYear()))
            {
                return 0;
            }
            if (date.getDay() > returnDate.getDay() && date.getMonth() == returnDate.getMonth() && date.getYear() == returnDate.getYear())
            {
                while (day > returnDate.getDay())
                {
                    count++;
                    day--;
                }
            }
            else if (date.getMonth() > returnDate.getMonth() && date.getYear() == returnDate.getYear())
            {
                if (date.getMonth() % 2 == 0)
                {
                    while (day < 31)
                    {
                        count++;
                        day++;
                    }
                }
                else
                {
                    while (day < 32)
                    {
                        count++;
                        day++;
                    }
                }
                day = 1;
                while (day <= returnDate.getDay())
                {
                    count++;
                    day++;
                }
            }
            else
            {
                while (year <= returnDate.getYear() && month != returnDate.getMonth() && day != returnDate.getDay())
                {
                    if (month == 12 && day == 31)
                    {
                        month = 1;
                        day = 1;
                        year++;
                    }
                    else if ((day == 31 && month % 2 != 0) || (day == 30 && month % 2 == 0) || (day == 29 && month == 2 && year % 4 == 0) || (day == 28 && month == 2 && year % 4 != 0))
                    {
                        day = 1;
                        month++;
                    }
                    else
                    {
                        count++;
                        day++;
                    }
                }
            }
            return count / 100;
        }
        public string getBookType()
        {
            return this.bookType;
        }
        public int getYearPublication()
        {
            return this.yearPublication;
        }
        public string getBookLocation()
        {
            return this.bookLocation;
        }
        public Date getIssueDate()
        {
            return issuedDate;
        }
        public void setIssueDate(Date issuedDate)
        {
            this.issuedDate = issuedDate;
        }
        public void setReturnDate(Date returnDate)
        {
            this.returnDate = returnDate;
        }
        public Date getReturnDate()
        {
            return returnDate;
        }
        public Person? getAuthor(int index)
        {
            if (authors.isRange(index))
            {
                return authors.get(index);
            }
            else
            {
                Console.WriteLine("Author not found!");
                return null;
            }
        }
        public void display()
        {
            Console.WriteLine("Book Name: " + getName());
            Console.WriteLine("Book ISBN: " + getISBN());
            Console.WriteLine("Book Access Number: " + getAccessNum());
            Console.WriteLine("Book Type: " + getBookType());
            Console.WriteLine("Book Location: " + getBookLocation());
            Console.WriteLine("Book Issue Date: ");
            getIssueDate().display();
            Console.WriteLine("Book Return Date: ");
            getReturnDate().display();
            Console.WriteLine("Book Authors: ");
            for (int i = 0; i < authors.Size(); i++)
            {
                Console.WriteLine((i + 1) + ". " + getAuthor(i));
            }
            Console.WriteLine("Book Publisher: " + getPublisher());
            Console.WriteLine("Book Publish Year: " + getYearPublication());
            Console.WriteLine("Book cost: " + getFees());
        }
    }
    public class Payment
    {
        string accountName, accountID;
        float balance;
        int code;
        Date expireDate;
        bool active_status;
        public Payment()
        {
            accountName = "Nobody";
            accountID = "None";
            balance = 0;
            code = 0;
            expireDate = new Date();
            active_status = false;
        }
        public Payment(string accountName, string accountID, float balance, int code, bool active_status, int day, int month, int year)
        {
            this.accountName = accountName;
            this.accountID = accountID;
            this.balance = balance;
            this.code = code;
            this.active_status = active_status;
            expireDate = new Date(day, month, year);
        }
        public string getAccountName()
        {
            return accountName;
        }
        public string getAccountID()
        {
            return accountID;
        }
        public void setAccountName(string accountName)
        {
            this.accountName = accountName;
        }
        public void setAccountID(string accountID)
        {
            this.accountID = accountID;
        }
        public void setBalance(float balance)
        {
            this.balance = balance;
        }
        public void setCode(int code)
        {
            this.code = code;
        }
        public float getBalance() { return balance; }
        public int getCode() { return code; }
        public bool isActive() { return active_status; }
        public void setExpirationDate(Date expirationDate)
        {
            this.expireDate = expirationDate;
        }
        public Date getExpireDate() { return expireDate; }
        public float addBalance(float balance)
        {
            this.balance += balance;
            return getBalance();
        }
        public float purchaseBook(Book book)
        {
            float money = book.getFees();
            book.setFees(0);
            return getBalance() - money;
        }
        public float payOverdue(Book book)
        {
            int get_day = 0, get_month = 0, get_year = 0;
            float subtractor;
            Console.WriteLine("Enter today's date shown on your screen: ");
            string date = Console.ReadLine();
            try
            {
                get_day = int.Parse(date.Substring(0, date.IndexOf("/")));
                get_month = int.Parse(date.Substring(date.IndexOf("/") + 1, date.LastIndexOf("/")));
                get_year = int.Parse(date.Substring(date.LastIndexOf("/") + 1));
            }
            catch (Exception e)
            {
                Console.WriteLine("There's an error in the program and is " + e.Message);
            }
            finally
            {
                if (get_day == 0)
                {
                    Console.WriteLine("Enter today's day number: ");
                    get_day = Convert.ToInt32(Console.ReadLine());
                }
                if (get_month == 0)
                {
                    Console.WriteLine("Enter today's month number: ");
                    get_month = Convert.ToInt32(Console.ReadLine());
                }
                if (get_year == 0)
                {
                    Console.WriteLine("Enter today's year number: ");
                    get_year = Convert.ToInt32(Console.ReadLine());
                }
                Date myDate = new Date(get_day, get_month, get_year);
                subtractor = book.calculateDelayFees(myDate);
            }
            return getBalance() - subtractor;
        }
        public bool isPurchased(Book theBook, float money)
        {
            return getBalance() == purchaseBook(theBook);
        }
        public bool isPaid(Book theBook, float money)
        {
            return getBalance() == payOverdue(theBook);
        }
        public void display()
        {
            Console.WriteLine("Account name: " + getAccountName());
            Console.WriteLine("Account ID: " + getAccountID());
            Console.WriteLine("Balance: " + getBalance());
            Console.WriteLine("Code: " + getCode());
            Console.WriteLine("Active Account Status = " + isActive());
            Console.WriteLine("Expiration Date: ");
            getExpireDate().display();
        }
    }
    public class User : Person
    {
        string username, password, email, phone;
        Date registrationDate;
        bool suspended = false, active = false;
        KWArrayList<Book> books;
        public User() : base()
        {
            username = "username";
            password = "password";
            email = "email";
            phone = "phone";
            registrationDate = new Date();
            books = new KWArrayList<Book>();
        }
        public User(string name, long id, int day, int month, int year, string username, string password, string email, string phone, int register_day, int register_month, int register_year, int size) : base(name, id, day, month, year)
        {
            this.username = username;
            this.password = password;
            this.email = email;
            this.phone = phone;
            registrationDate = new Date(register_day, register_month, register_year);
            books = new KWArrayList<Book>(size);
        }
        public bool login(string username, string password)
        {
            if (username == "username" || password == "password")
            {
                return active;
            }
            else if (username != this.username || password != this.password)
            {
                return active;
            }
            else
            {
                active = true;
                return active;
            }
        }
        public void logout()
        {
            username = "username";
            password = "password";
            active = false;
        }
        public string getUsername()
        {
            return username;
        }
        public string getPassword()
        {
            return password;
        }
        public void setUsername(string username)
        {
            this.username = username;
        }
        public void setPassword(string password)
        {
            this.password = password;
        }
        public void setEmail(string email)
        {
            this.email = email;
        }
        public void setPhone(string phone)
        {
            this.phone = phone;
        }
        public string getEmail()
        {
            return email;
        }
        public string getPhone()
        {
            return phone;
        }
        public bool isActive()
        {
            return active;
        }
        public bool isSuspend()
        {
            return suspended;
        }
        public void setDateRegistered(Date dateRegistered)
        {
            registrationDate = dateRegistered;
        }
        public Date getDateRegistered()
        {
            return registrationDate;
        }
        public bool borrowBook(Book book)
        {
            books.add(book);
            return books.get(books.Size() - 1) != book;
        }
        public Book? returnBook(Book book)
        {
            int location = books.indexOf(book);
            Book item;
            if (location != -1)
            {
                item = books.get(location);
            }
            else
            {
                item = null;
            }
            books.remove(books.search(book));
            return item;
        }
        public bool searchBook(Book book)
        {
            return books.search(book) != -1;
        }
        internal KWArrayList<Book> getBooks()
        {
            return books;
        }
        public void updateProfile(User user)
        {
            setName(user.getName());
            setUsername(user.getUsername());
            setPassword(user.getPassword());
            setAge(user.getAge());
            setID(user.getID());
            setEmail(user.getEmail());
            setPhone(user.getPhone());
            setDateRegistered(user.getDateRegistered());
        }
        public string toString()
        {
            string can = "Details about the account: \n";
            can += "Name: " + getName() + "\n";
            can += "ID: " + getID() + "\n";
            can += "Age: " + getAge() + "\n";
            can += "Email: " + getEmail() + "\n";
            can += "Phone: " + getPhone() + "\n";
            can += "Username: " + getUsername() + "\n";
            can += "Password: " + getPassword() + "\n";
            can += "Account Active status: " + isActive() + "\n";
            can += "Account suspend status: " + isSuspend() + "\n";
            can += "Date registered: " + getDateRegistered() + "\n";
            return can;
        }
    }
    public class Customer : User, IPerson
    {
        Payment bankAccount;
        public Customer() : base()
        {
            bankAccount = new Payment();
        }
        public Customer(string name, long id, int day, int month, int year, string username, string password, string email, string phone, int register_day, int register_month, int register_year, int size, string accountName, string accountID, float balance, int code, bool active_status) : base(name, id, day, month, year, username, password, email, phone, register_day, register_month, register_year, size)
        {
            bankAccount = new Payment(accountName, accountID, balance, code, active_status, day, month, year);
        }
        public void setName(string name)
        {
            setName(name);
        }
        public void setAge(int day, int month, int year)
        {
            setAge(day, month, year);
        }
        public void setID(long id)
        {
            setID(id);
        }
        public string getName()
        {
            return getName();
        }
        public long getID()
        {
            return getID();
        }
        public int getAge()
        {
            return getAge();
        }
        public bool isBookPurchased(Book theBook)
        {
            return theBook.getFees() == 0;
        }
        public bool borrowBook(Book book)
        {
            getBooks().add(book);
            return getBooks().get(getBooks().Size() - 1) != book;
        }
        public Book? returnBook(Book book)
        {
            int location = getBooks().indexOf(book);
            Book item;
            if (location != -1)
            {
                item = getBooks().get(location);
            }
            else
            {
                item = null;
            }
            getBooks().remove(getBooks().search(book));
            return item;
        }
        public bool searchBook(Book book)
        {
            return getBooks().search(book) != -1;
        }
        public float purchaseBook(Book book, float money)
        {
            if (money == book.getFees() && !isBookPurchased(book))
            {
                book.setFees(0);
                return bankAccount.getBalance()-money;
            }
            return -1;
        }
        public void display()
        {
            string can = "Details about the customer: \n";
            can += "Name: " + getName() + "\n";
            can += "ID: " + getID() + "\n";
            can += "Age: " + getAge() + "\n";
            can += "Email: " + getEmail() + "\n";
            can += "Phone: " + getPhone() + "\n";
            can += "Username: " + getUsername() + "\n";
            can += "Password: " + getPassword() + "\n";
            can += "Account Active status: " + isActive() + "\n";
            can += "Account suspend status: " + isSuspend() + "\n\n";
            Console.WriteLine(can);
            Console.WriteLine("Bank account details: \n");
            bankAccount.display();
        }
    }
}