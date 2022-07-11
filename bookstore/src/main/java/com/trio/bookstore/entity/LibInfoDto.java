package com.trio.bookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LibInfoDto {

   private int libInfoNo;
   private String libraryName;
   private String libraryAddress;
   private String libraryGu;
   private String libraryTel;
   private String libraryUrl;
   private String libraryTime;
   private String libraryCloseDate;
   private String libraryXcnts;
   private String libraryYdnts;

}