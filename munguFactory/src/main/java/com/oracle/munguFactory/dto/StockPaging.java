package com.oracle.munguFactory.dto;

import lombok.Data;

@Data
public class StockPaging {
   private int currentPage = 1;
   private int rowPage = 10;
   private int pageBlock = 5;
   private int start;
   private int end;
   private int startPage;
   private int endPage;
   private int total;
   private int totalPage;
   
   public StockPaging(int total, String currentPage1) {
      this.total = total;
      if(currentPage1 != null) {
         this.currentPage = Integer.parseInt(currentPage1);
      }
      start = (currentPage - 1) * rowPage;
      end = start + rowPage - 1;
      totalPage = (int)Math.ceil((double)total / rowPage);
      startPage = currentPage - (currentPage - 1) % pageBlock;
      endPage = startPage + pageBlock - 1;
      
      if(endPage > totalPage) {
         endPage = totalPage;
      }
   }
}