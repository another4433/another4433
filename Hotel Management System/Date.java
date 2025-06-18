// Import DateInt interface before usage
// Use "import com.company.DateInt;" or something like that
// You don't need to do these when the files are located in the same src folder without syntax errors

public class Date implements DateInt {
    int day, month, year;

    public Date(int day, int month, int year) {
        this.day = (day <= 0 || day > 31) ? 1 : day;
        this.month = (month <= 0 || month > 12) ? 1 : month;
        this.year = (year <= 0) ? 2000 : year;
    }

    @Override
    public int getDay() {
        return day;
    }

    @Override
    public void setDay(int day) {
        this.day = (day <= 0 || day > 31) ? 1 : day;
    }

    @Override
    public int getMonth() {
        return month;
    }

    @Override
    public void setMonth(int month) {
        this.month = (month <= 0 || month > 12) ? 1 : month;
    }

    @Override
    public int getYear() {
        return year;
    }

    @Override
    public void setYear(int year) {
        this.year = (year <= 0) ? 2000 : year;
    }

    @Override
    public void display(){
        System.out.println("Date: "+getDay()+"-"+getMonth()+"-"+getYear());
    }

    @Override
    public String toString(){
        return getDay()+"-"+getMonth()+"-"+getYear();
    }
}
