package model;

import java.sql.Date;
import java.sql.Timestamp;

public class Booking {

    private int idBooking;
    private User user = new User();
    private Timestamp orderTime;
    private Date checkIn;
    private Date checkOut;
    private String note;
    private Hotel hotel = new Hotel();
    private int statusBooking;

    public int getStatusBooking() {
        return statusBooking;
    }

    public void setStatusBooking(int statusBooking) {
        this.statusBooking = statusBooking;
    }

    public Booking() {
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public Booking(int idBooking, User User, Timestamp orderTime, Date checkIn, Date checkOut, String note) {

        this.idBooking = idBooking;
        this.user = User;
        this.orderTime = orderTime;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.note = note;
    }

    public int getIdBooking() {
        return idBooking;
    }

    public void setIdBooking(int idBooking) {
        this.idBooking = idBooking;
    }

    public User getUser() {
        return user;
    }

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
