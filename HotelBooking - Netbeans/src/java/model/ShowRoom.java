/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author onglu
 */
public class ShowRoom {
    private ArrayList<RoomImage> roomImages=new ArrayList<>();
    private RoomType roomType=new RoomType();
    private ArrayList<Utilities> roomUltilities=new ArrayList<>();
    private DetailBooking detailBookingRoom=new DetailBooking();
    private int gia;

    public ShowRoom() {
    }

    public ShowRoom(RoomType roomType, ArrayList<Utilities> roomUltilities, DetailBooking detailBookingRoom,int gia) {
        this.roomType = roomType;
        this.roomUltilities = roomUltilities;
        this.detailBookingRoom = detailBookingRoom;
        this.gia=gia;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    
    public ArrayList<RoomImage> getRoomImages() {
        return roomImages;
    }

    public void setRoomImages(ArrayList<RoomImage> roomImages) {
        this.roomImages = roomImages;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }

    public ArrayList<Utilities> getRoomUltilities() {
        return roomUltilities;
    }

    public void setRoomUltilities(ArrayList<Utilities> roomUltilities) {
        this.roomUltilities = roomUltilities;
    }

    public DetailBooking getDetailBookingRoom() {
        return detailBookingRoom;
    }

    public void setDetailBookingRoom(DetailBooking detailBookingRoom) {
        this.detailBookingRoom = detailBookingRoom;
    }
    
}
