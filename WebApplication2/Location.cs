namespace WebApplication2
{
    public class Location
    {
        public double Longitude { get; set; }
        public double Latitude { get; set; }

        public Location(double lng, double lat)
        {
            Longitude = lng;
            Latitude = lat;
        }

        public Location()
        {
                
        }

        public override bool Equals(object obj)
        {
            Location l=obj as Location;
            return l.Latitude == this.Latitude && l.Longitude == this.Longitude;
        }
    }
}