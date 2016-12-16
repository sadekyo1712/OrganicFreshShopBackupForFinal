package com.OrganicFreshShop.model;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by root on 11/22/16.
 */
public class PaginatorResult<E> {

    private int totalRecord;
    private int currentPage;
    private List<E> list;
    private int recordEachPage;
    private int totaLPage;
    private int maxNavigationPage;
    private List<Integer> navigateBar;
    private int numberOrder;
    private static final int ELLIPSIS = -1;

    public PaginatorResult( int currentPage, int recordEachPage,
                            int maxNavigationPage, List list, int totalRecord ) {

        this.recordEachPage = recordEachPage;
        this.maxNavigationPage = maxNavigationPage;
        this.list = list;
        this.totalRecord = totalRecord;
        totaLPage = ( int )Math.ceil( ( double )totalRecord / ( double )recordEachPage );
        this.currentPage = ( ( currentPage >= 1 ) && ( currentPage <= totaLPage ) ) ? currentPage : 1;
        this.calculateNavigationBar();
    }

    public void calculateNavigationBar() {

        this.navigateBar = new ArrayList<>();
        int beginPage = currentPage - maxNavigationPage / 2;
        int endPage = currentPage + maxNavigationPage / 2 - 1;
        navigateBar.add(1);
        if ( beginPage > 2 )
            navigateBar.add( ELLIPSIS );
        for ( int i = beginPage; i <= endPage; i++ ) {
            if ( ( i > 1 ) && ( i <= totaLPage ) )
                navigateBar.add( i );
        }
        if ( endPage < totaLPage ) {
            if ( endPage < ( totaLPage - 1 ) )
                navigateBar.add( ELLIPSIS );
            navigateBar.add( totaLPage );
        }
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public int getMaxNavigationPage() {
        return maxNavigationPage;
    }

    public int getRecordEachPage() {
        return recordEachPage;
    }

    public int getTotaLPage() {
        return totaLPage;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getNumberOrder() {
        return numberOrder;
    }

    public void setNumberOrder(int numberOrder) {
        this.numberOrder = numberOrder;
    }

    public List<E> getList() {
        return list;
    }

    public List<Integer> getNavigateBar() {
        return navigateBar;
    }


    @Override
    public String toString() {
        return "[ Paginator result :\nList : " + this.getList() + "\nNav bar : " + this.getNavigateBar() + "\n ]";
    }
}
