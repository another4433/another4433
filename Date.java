public class Date implements IDate {
    int day, month, year;
    String date;
    public Date(){
        day = 0;
        month = 0;
        year = 0;
        date = day+"-"+month+"-"+year;
    }
    public Date(int day, int month, int year){
        this.day = (day <= 0 || day >= 32) ? 1 : day;
        this.month = (month <= 0 || month >= 13) ? 1 : month;
        this.year = year;
        date = this.day+"-"+this.month+"-"+this.year;
    }
    @Override
    public int getDay() {
        return day;
    }
    public void setDay(int day) {
        this.day = (day <= 0 || day >= 32) ? 1 : day;
        date = getDay()+"-"+getMonth()+"-"+getYear();
    }
    @Override
    public int getMonth() {
        return month;
    }
    public void setMonth(int month) {
        this.month = (month <= 0 || month >= 13) ? 1 : month;
        date = getDay()+"-"+getMonth()+"-"+getYear();
    }
    @Override
    public int getYear() {
        return year;
    }
    public void setYear(int year) {
        this.year = year;
        date = getDay()+"-"+getMonth()+"-"+getYear();
    }
    @Override
    public String getDate() {
        return date;
    }
    public void display(){
        System.out.println("Date: "+getDate());
    }
}
