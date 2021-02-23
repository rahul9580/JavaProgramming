package lowleveldesign.KeyValueStore;

public class Data {
    private String latitude;
    private String longitude;
    private String pollutionLevel;

    public void setPopulation(Integer population) {
        this.population = population;
    }

    private Integer population;

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public void setPollutionLevel(String pollutionLevel) {
        this.pollutionLevel = pollutionLevel;
    }
}
