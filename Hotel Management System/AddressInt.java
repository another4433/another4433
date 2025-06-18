public interface AddressInt {
    void setHouse(int house);
    void setRoad(int road);
    void setBlock(int block);
    void setArea(String area);
    void setState(String state);
    void setContinent(String continent);
    void setCountry(String country);
    void setRegion(String region);
    String getRegion();
    int getHouse();
    int getRoad();
    int getBlock();
    String getArea();
    String getState();
    String getContinent();
    String getCountry();
    void display();
}
