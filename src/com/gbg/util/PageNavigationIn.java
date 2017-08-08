package com.gbg.util;

public class PageNavigationIn {

      private String root;
      private boolean nowFirst;// 이전관리
      private boolean nowEnd;// 다음관리
      private int newArticleCount;// 새글수
      private int totalArticleCount;// 전체글수
      private int totalPageCount;// 전체페이지수
      private int pageNo;// 현재페이지
      private String navigator;// 페이징

      public String getRoot() {
         return root;
      }

      public void setRoot(String root) {
         this.root = root;
      }

      public boolean isNowFirst() {
         return nowFirst;
      }

      public void setNowFirst(boolean nowFirst) {
         this.nowFirst = nowFirst;
      }

      public boolean isNowEnd() {
         return nowEnd;
      }

      public void setNowEnd(boolean nowEnd) {
         this.nowEnd = nowEnd;
      }

      public int getNewArticleCount() {
         return newArticleCount;
      }

      public void setNewArticleCount(int newArticleCount) {
         this.newArticleCount = newArticleCount;
      }

      public int getTotalArticleCount() {
         return totalArticleCount;
      }

      public void setTotalArticleCount(int totalArticleCount) {
         this.totalArticleCount = totalArticleCount;
      }

      public int getTotalPageCount() {
         return totalPageCount;
      }

      public void setTotalPageCount(int totalPageCount) {
         this.totalPageCount = totalPageCount;
      }

      public int getPageNo() {
         return pageNo;
      }

      public void setPageNo(int pageNo) {
         this.pageNo = pageNo;
      }

      public String getNavigator() {
         return navigator;
      }

      public void setNavigator() {
         StringBuffer tmpNavigator = new StringBuffer();

         int prePage = (pageNo - 1) / BoardConstance.PAGE_SIZE * BoardConstance.PAGE_SIZE;
         
         tmpNavigator.append("<navv  align="+"center"+">\n");
         tmpNavigator.append("   <ul class="+"pagination"+">\n");

         if (this.isNowFirst()) {
            tmpNavigator.append("   <li class="+"page-item disabled"+">\n");
            tmpNavigator.append("   <a class="+"page-link"+" href="+"#"+" tabindex="+-1+" aria-label="+"Previous"+">\n");
            tmpNavigator.append("   <span aria-hidden="+true+">&laquo;</span>\n");
            tmpNavigator.append("     </a></li>\n");
         } else {
            tmpNavigator.append("   <li class="+"page-item disabled"+">\n");
            tmpNavigator.append("   <a class="+"page-link"+" href='#' id=backpageBtn tabindex="+-1+" aria-label="+"Previous"+">\n");
            tmpNavigator.append("   <span aria-hidden="+true+">&laquo;</span>\n");
            tmpNavigator.append("     </a></li>\n");
         }
         
         int startPage = prePage + 1;
         int endPage = startPage + (BoardConstance.PAGE_SIZE - 1);
         if(endPage > totalPageCount)
            endPage = totalPageCount;
         
         for (int i = startPage; i <= endPage; i++) {
            if (pageNo == i) {
               tmpNavigator.append("     <li class="+"page-item"+"><a class="+"page-link"+">"+i+"</a></li>" +"\n");
            } else {
               tmpNavigator.append("     <li class="+"page-item"+"><a class='listselect'>"+i+"</a></li>" +"\n");
            }
         }
         
         if (this.isNowEnd()) {
            tmpNavigator.append("  <li class="+"page-item"+">\n");
            tmpNavigator.append("    <a class="+"page-link"+" href="+"#"+" aria-label="+"Next"+">\n");
            tmpNavigator.append("   <span aria-hidden="+true+">&raquo;</span>\n");
            tmpNavigator.append("   </a>\n");
            tmpNavigator.append("  </li>\n");
         } else {
            int nextPage = prePage + BoardConstance.PAGE_SIZE + 1;
            tmpNavigator.append("  <li class="+"page-item"+">\n");
//            tmpNavigator.append("    <a id=nextpageBtn  class="+"page-link"+" href='#' aria-label="+"Next"+">\n");
            tmpNavigator.append("    <a id=nextpageBtn  class='nextpageBtncc' href='#' aria-label="+"Next"+">\n");
            tmpNavigator.append("   <span aria-hidden="+true+">&raquo;</span>\n");
            tmpNavigator.append("   </a>\n");
            tmpNavigator.append("  </li>\n");
         }

         tmpNavigator.append("  </ul>\n");
         tmpNavigator.append(" </navv>\n");

         this.navigator = tmpNavigator.toString();
      }

   }