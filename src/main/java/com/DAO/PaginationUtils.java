package com.DAO;

import java.util.List;
public class PaginationUtils {
    public static <T> List<T> paginate(List<T> dataList, int page, int pageSize) {
        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, dataList.size());
        return dataList.subList(startIndex, endIndex);
    }

    public static int calculateTotalPages(int totalItems, int pageSize) {
        return (int) Math.ceil((double) totalItems / pageSize);
    } 
}