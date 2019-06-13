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
public class SearchHotel {
    
    private HotelImage hotelImage;
    private ArrayList<Utilities> utilitieses;

    public SearchHotel() {
    }

    public SearchHotel(HotelImage hotelImage, ArrayList<Utilities> utilitieses) {
        this.hotelImage = hotelImage;
        this.utilitieses = utilitieses;
    }

    public HotelImage getHotelImage() {
        return hotelImage;
    }

    public void setHotelImage(HotelImage hotelImage) {
        this.hotelImage = hotelImage;
    }

    public ArrayList<Utilities> getUtilitieses() {
        return utilitieses;
    }

    public void setUtilitieses(ArrayList<Utilities> utilitieses) {
        this.utilitieses = utilitieses;
    }

    
}
