package com.OrganicFreshShop.model;

import java.util.ArrayList;

/**
 * Created by sadekyo1712
 * Desc : yolo, code & code for fun :D
 * KSCLC K57 - PFIEV - BKHN
 * Project : OrganicFreshShop
 * Package : com.OrganicFreshShop.model
 * Time : 8:41 PM
 * Date : 1/11/17/January
 * Year : 2017
 */
public class ProductInfo {
    private String code;
    private String category;
    private String type;
    private String source;
    private int discount;
    private String seqcComment;
    private String[] comment;
    private ArrayList<String> commentList = new ArrayList<>();
    private int rate;

    public void commentSplit() {
        if ( seqcComment.equals("") ) {
            comment = null;
            return;
        }
        if ( !seqcComment.contains("@@@@") ) {
            comment = new String[]{ seqcComment };
            return;
        }
        comment = seqcComment.split("@@@@");
    }

    public int getDiscount() {
        return discount;
    }

    public int getRate() {
        return rate;
    }

    public String getCategory() {
        return category;
    }

    public String getCode() {
        return code;
    }

    public String getSeqcComment() {
        return seqcComment;
    }

    public String getSource() {
        return source;
    }

    public String getType() {
        return type;
    }

    public String[] getComment() {
        return comment;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setComment(String[] comment) {
        this.comment = comment;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public void setSeqcComment(String seqcComment) {
        this.seqcComment = seqcComment;
        this.commentSplit();
    }

    public void setSource(String source) {
        this.source = source;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "product_addition_detail toString()";
    }
}
