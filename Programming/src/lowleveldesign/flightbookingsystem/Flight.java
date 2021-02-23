package lowleveldesign.flightbookingsystem;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public class Flight {
    String flightNo;
    String source;
    String destination;
    String serviceProvider;
}

class Schedule {
    String scheduleId;
    String flightNo;
    LocalDateTime departureTime;
    LocalDateTime arrivalTime;
    String seatInfoId;
}

class Seat {
    Integer seatId;
    SeatType seatType;
    Boolean isWindowSide;
    Boolean isComfurtable;
    BigDecimal price;
}

class SeatInfo {
    String seatInfoId;
    String flightId;
    // Map<Integer, Seat>
    List<Seat> allSeats;
    List<Seat> bookedSeats;
}

enum SeatType {
    ECONOMY, BUSINESS
}

class Booking {
    String bookingId;
    String scheduleId;
    List<Seat> seats;
    BigDecimal bookingAmount;
    LocalDateTime bookingTime;
    String userId;
    List<Passenges> passenges;

}

class BookingStatus {

}

class Passenges {
    String registeredUserId; // mandatory

}


class BookingService {

    Boolean bookSeats(Flight flight, List<Seat> seats) {
        return true;
    }
}